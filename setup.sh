#!/usr/bin/env zsh
# Only need to run this once
git submodule update --init --recursive

if [[ "$(uname)" = Linux* ]]; then
  ./setup_linux.sh
elif [[ "$(uname)" = Darwin* ]]; then
  brew install zsh
  ./setup_mac.sh
fi

stow home nvim zsh git autorandr 

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

git clone https://github.com/gcuisinier/jenv.git ~/.jenv

if [[ "$(uname)" = Linux* ]]; then
  sudo pip install --upgrade pip
  sudo pip install virtualenv
  sudo pip install virtualenvwrapper

  source ~/.zshrc
  jenv add ${JAVA7_HOME}
  jenv add ${JAVA8_HOME}
fi

mkdir -p ~/.local-setup

local_setup_dir=~/.local-setup

mkdir -p ${local_setup_dir}
cd ${local_setup_dir}


curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
sh ./dein_installer.sh ~/.cache/dein

cd ~/dotfiles

