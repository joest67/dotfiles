#!/usr/bin/env bash

########################################
#     Use constom config files         #
#    This file can be run many times.  #
########################################
rc_files=(
    zshrc
    gitconfig
    gitignore_global
    tmux.conf
    tigrc
)

today=`date +%Y%m%d%H%M%S`
for rc_file in "${rc_files[@]}"
do
    echo "replace $rc_file..."
    link_file="$HOME/.$rc_file"
    dest_file="$HOME/.dotfiles/conf/rc/$rc_file"
    echo $origin_file
    if [ -f "$link_file" ]
    then
        echo "$link_file exists, make backup => $link_file.bak_$today"
        mv $link_file{,.bak}
    fi
    ln -sf $dest_file $link_file
done
