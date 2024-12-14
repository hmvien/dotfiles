#!/usr/bin/env zsh
# Only need to run this once

set -e 

git submodule update --init --recursive

if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [[ "$(uname)" = Linux* ]]; then
  # Add brew to path only for this setup script
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  
  distro=$(lsb_release --id --short | grep -v "No LSB")

  if [[ "$distro" = "Ubuntu" ]]; then
    ./setup_ubuntu.sh
  elif [[ "$distro" = "ManjaroLinux" ]]; then
    ./setup_mancharo.sh
  fi
elif [[ "$(uname)" = Darwin* ]]; then
  brew install zsh
  ./setup_mac.sh
fi

stow home nvim zsh git autorandr wezterm tmux

if ! grep -q '.bashrc_local' ~/.bashrc; then
  echo "source ~/.bashrc_local" >> ~/.bashrc
fi

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

