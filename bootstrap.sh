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
      git-flow

fi

if which apt-get > /dev/null; then
    sudo apt-get autojump
fi


# pip
if ! which pip > /dev/null ;then
    curl -L https://bootstrap.pypa.io/get-pip.py | python
fi

pip install -U virtualenvwrapper


#################################
#    Use constom config files   #
#################################
echo "remove original config files"
rm -rf $HOME/.zshrc
rm -rf $HOME/.pip

echo "link new config files"
ln -sf $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/.dotfiles/.pip $HOME/.pip


if [ "$(zsh)" != "/bin/bash" ]; then
    chsh /bin/zsh
fi
