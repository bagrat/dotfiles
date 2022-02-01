#!/bin/sh

set -e

git clone https://github.com/bagrat/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
sh install.sh
