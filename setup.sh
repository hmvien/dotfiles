#!/bin/bash
# Only need to run this once 

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
    ./install.sh
fi

