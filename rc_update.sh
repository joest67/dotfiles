#!/usr/bin/env bash

########################################
#     Use constom config files         #
#    This file can be run many times.  #
########################################
rc_files=(
    zshrc
    pip
    gitconfig
    byobu
    tmux.conf
)

for source_file in "${rc_files[@]}"
do
    echo "replace $source_file"
    origin_file="$HOME/.$source_file"
    if [ -f "$origin_file" ]
    then
        echo "origin file $origin_file exists, make backup"
        mv $origin_file{,.bak}
    fi
    ln -sf $HOME/.dotfiles/$source_file $origin_file
done
