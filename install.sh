#!/bin/sh

set -e

DOTFILES_SOURCE_PATH="$(cd $(dirname $0); pwd)"
echo "Installing dotfiles from $DOTFILES_SOURCE_PATH"

DOTFILES=~/.dotfiles

if [ "$DOTFILES_SOURCE_PATH" != "$DOTFILES" ] && [ ! -e ~/.dotfiles ]
then
	ln -s "$DOTFILES_SOURCE_PATH" "$DOTFILES"
fi


if [ -z "$ZSH" ]
then
	OMZSH_INSTALL_DIR=$(mktemp -d)
	OMZSH_INSTALLER="${OMZSH_INSTALL_DIR}/install-omzsh.sh"

	echo "Installing OhMyZsh..."
	curl -Lo $OMZSH_INSTALLER https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
	sh $OMZSH_INSTALLER --unattended
fi


echo "Configuring custom zsh files..."
ZSHRC_PATH=~/.zshrc
BAK_EXT='.bak'
BAK_FILE="${ZSHRC_PATH}${BAK_EXT}"
sed -i $BAK_EXT 's/^# ZSH_CUSTOM=.*/ZSH_CUSTOM=~\/\.dotfiles\/zsh/' $ZSHRC_PATH
[ -f "$BAK_FILE" ] && rm $BAK_FILE


if ! brew --help &> /dev/null
then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

