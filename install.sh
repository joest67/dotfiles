#!/bin/bash

echo "Remove existing dot files ..."

rm -rf ~/.dotfiles

echo "Clone new dot files ..."
/usr/bin/env git clone git@github.com:joest67/dotfiles.git ~/.dotfiles || exit 1
