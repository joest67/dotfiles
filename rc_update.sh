#!/usr/bin/env bash

########################################
#     Use constom config files         #
#    This file can be run many times.  #
########################################
rc_files=(
    .zshrc
    .pip
    .gitconfig
    .byobu
)

for i in "${rc_files[@]}"
do
    echo "replace $i"
    rm -rf $HOME/$i
    source_file=$(echo $i|cut -d '.' -f 2)
    ln -sf $HOME/.dotfiles/$source_file $HOME/$i
done
