#!/bin/sh

set -e

if brew --help &> /dev/null
then
	echo "Uninstalling Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)"
fi

if [ ! -z $ZSH ]
then
	echo "Uninstalling OhMyZsh..."
	sh ~/.oh-my-zsh/tools/uninstall.sh
fi

[ -e ~/.dotfiles ] && rm -r ~/.dotfiles
