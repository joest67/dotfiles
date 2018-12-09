#!/usr/bin/env bash

#################################
#    Install useful software    #
#################################

echo "Install useful software"

if [ "$(uname)" = "Darwin" ]; then
    if ! which brew > /dev/null; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        brew doctor
    fi

    if ! brew cask > /dev/null ; then
        brew install caskroom/cask/brew-cask
        brew tap caskroom/versions
    fi


brew install   \
      vim      \
      pyenv    \
      zsh      \
      byobu    \
      autojump \
      git-flow \
      fzf \
      tig \
      reattach-to-user-namespace

fi

if which apt-get > /dev/null; then
    sudo apt-get autojump zsh
fi


# pip
if ! which pip > /dev/null ;then
    curl -L https://bootstrap.pypa.io/get-pip.py | python
fi

sudo pip install -U virtualenvwrapper


if [ "$(zsh)" != "/bin/bash" ]; then
    chsh /bin/zsh
fi
