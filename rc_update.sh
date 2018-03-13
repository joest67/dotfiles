#!/usr/bin/env bash

########################################
#     Use constom config files         #
#    This file can be run many times.  #
########################################
rc_files=(
    zshrc
    gitconfig
    tmux.conf
)

today=`date +%Y%m%d%H%M%S`
for source_file in "${rc_files[@]}"
do
    echo "==== replace $source_file ===="
    origin_file="$HOME/.$source_file"
    echo $origin_file
    if [ -f "$origin_file" ]
    then
        echo "origin file $origin_file exists, make backup => $origin_file.bak_$today"
        mv $origin_file{,.bak}
    fi
    ln -sf $HOME/.dotfiles/conf/$source_file $origin_file
done
