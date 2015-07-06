#!/bin/bash

# backup
echo "Backing up old dotfiles configs"
today=`date +%Y%m%d`
mv $HOME/.dotfiles $HOME/dotfiles.$today

echo "Clone new dot files ..."
/usr/bin/env git clone git@github.com:joest67/dotfiles.git ~/.dotfiles || exit 1
