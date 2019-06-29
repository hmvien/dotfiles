#!/usr/bin/zsh
# Only need to run this once

git submodule update --init --recursive

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "Installing vim vundle..."
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/gcuisinier/jenv.git ~/.jenv

# not Windows git bash environment
if [[ "$(uname)" != MING* ]]; then
  if [[ "$(uname)" = Darwin* ]]; then
    echo "Installing zsh..."
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  fi

  if [[ "$(uname)" = Linux* ]]; then
    yay -S python3 python-pip 
    sudo pip install --upgrade pip
    sudo pip install virtualenv
    sudo pip install virtualenvwrapper

    yay -S terminator

    yay -S jdk7-openjdk jdk8-openjdk jre7-openjdk jre8-openjdk maven
    source ~/.zshrc
    jenv add ${JAVA7_HOME}
    jenv add ${JAVA8_HOME}

    echo; echo; echo
    echo '========='
    echo 'Make sure you run "echo 2 > /sys/module/hid_apple/parameters/fnmode" as root'
  fi

  echo "Installing autojump..."
  git clone git://github.com/joelthelion/autojump.git ~/autojump
  cd ~/autojump
  python ./install.py
  cd ~
fi

