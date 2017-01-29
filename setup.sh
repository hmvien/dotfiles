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
git clone https://github.com/gcuisinier/jenv.git ~/.jenv

source ~/.zshrc
jenv add ${JAVA7_HOME}
jenv add ${JAVA8_HOME}

# not Windows git bash environment
if [[ "$(uname)" != MING* ]]; then
  if [[ "$(uname)" = Darwin* ]]; then
    echo "Installing zsh..."
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  fi

  echo "Installing autojump..."
  git clone git://github.com/joelthelion/autojump.git ~/autojump
  cd ~/autojump
  python ./install.py
  cd ~

  if [[ "$(uname)" = Linux* ]]; then
    sudo apt-get install python3 python3-pip python3-dev python3-setuptools
    sudo pip3 install --upgrade pip
    sudo pip3 install virtualenv
    sudo pip3 install virtualenvwrapper

    sudo apt-get install terminator
    sudo apt-get install openjdk-8-jdk openjdk-8-jre
    echo; echo; echo
    echo '========='
    echo 'Make sure you run "echo 2 > /sys/module/hid_apple/parameters/fnmode" as root'
  fi
fi

