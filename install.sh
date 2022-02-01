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


if [ -z "$PRIVATE_PATH" ]
then
	read -n 1 -p "Do you want to configure private stuff? [y/n] " YES
	echo
	if [ "$YES" == "y" ]
	then
		read -p "Enter the private path relative to home ($HOME): " PRIVATE_PATH_INPUT
		PRIVATE_PATH="${HOME}/${PRIVATE_PATH_INPUT}"

		if [ ! -z "$PRIVATE_PATH" ] && [ -e "$PRIVATE_PATH" ]
		then
			PRIVATE_PATH=$(cd $PRIVATE_PATH; pwd)
		else
			echo "You haven't supplied an existing private path, skipping..."
			PRIVATE_PATH=""
		fi
	fi
fi

if [ ! -z "$PRIVATE_PATH" ]
then
	echo "Setting up SSH"
	mkdir -p ~/.ssh
	THIS_USER=$USER
	sudo cp $PRIVATE_PATH/ssh/id_rsa* ~/.ssh/
	sudo chown -R $THIS_USER ~/.ssh
	sudo chmod 400 ~/.ssh/id_rsa*

	cd ~/.dotfiles > /dev/null
	if git remote -v | grep https > /dev/null
	then
		echo "Changing .dotfiles repo origin to Git"
		git remote remove origin
		git remote add origin git@github.com:bagrat/dotfiles.git
	fi
	cd - > /dev/null

	echo "Setting up git config"
	echo "[include]\n\tpath = $PRIVATE_PATH/gitconfig/main.gitconfig" > ~/.gitconfig
fi
