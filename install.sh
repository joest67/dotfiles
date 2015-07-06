#!/bin/bash

# backup
echo "Backing up old dotfiles configs"
if [ -e $HOME/.dotfiles ]; then
    today=`date +%Y%m%d`
    mv $HOME/.dotfiles $HOME/.dotfiles.$today
fi

echo "Clone new dot files ..."
/usr/bin/env git clone git@github.com:joest67/dotfiles.git ~/.dotfiles || exit 1
