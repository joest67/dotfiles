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


echo "install mac bundles"
brew install   \
      vim      \
      pyenv    \
      zsh      \
      autojump \
      fzf \
      tig \
      reattach-to-user-namespace \
      fzf

fi

if which apt-get > /dev/null; then
    echo "install Linux bunldes"
    sudo apt-get autojump zsh
fi


# pip
if ! which pip > /dev/null ;then
    curl -L https://bootstrap.pypa.io/get-pip.py | python
fi

sudo pip install -U virtualenvwrapper


# use zsh
if [ "$(zsh)" != "/bin/bash" ]; then
    chsh /bin/zsh
fi
