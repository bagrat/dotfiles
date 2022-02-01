#!/bin/sh

set -e

git clone git@github.com:bagrat/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
sh install.sh
