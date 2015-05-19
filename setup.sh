#!/usr/bin/zsh
# Only need to run this once

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

git submodule update --init --recursive

echo "Installing vim vundle..."
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Windows git bash environment
if [[ "$(uname)" != MING* ]]; then
    echo "Installing zsh..."
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

    echo "Installing autojump..."
    git clone git://github.com/joelthelion/autojump.git ~/autojump
    cd ~/autojump
    python ./install.py
fi
