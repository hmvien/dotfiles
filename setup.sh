#!/usr/bin/env zsh
# Only need to run this once
git submodule update --init --recursive

if [[ "$(uname)" = Linux* ]]; then
  ./setup_linux.sh
elif [[ "$(uname)" = Darwin* ]]; then
  ./setup_mac.sh
fi

stow home vim zsh git autorandr i3

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "Installing vim vundle..."
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/gcuisinier/jenv.git ~/.jenv

if [[ "$(uname)" = Linux* ]]; then
  sudo pip install --upgrade pip
  sudo pip install virtualenv
  sudo pip install virtualenvwrapper

  source ~/.zshrc
  jenv add ${JAVA7_HOME}
  jenv add ${JAVA8_HOME}
fi

echo "Installing autojump..."
git clone git://github.com/joelthelion/autojump.git ~/.autojump
cd ~/.autojump
python ./install.py

cd ~/dotfiles

