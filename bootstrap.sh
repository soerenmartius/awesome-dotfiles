#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

# check if zsh is installed
if ! type zsh &> /dev/null; then
	echo "Zsh isn't installed. Please install zsh first of run brew.sh if you are on OSX.";
fi;

# install zgen plugin manager
if ! [ -d "${HOME}/.zgen" ]; then
	git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
else
	echo "Skipping: ${HOME}/.zgen exists. Seems like zgen is already installed!";
fi;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".idea" \
		--exclude ".macos" \
		--exclude "brew.sh" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh $1 --no-perms . ~;
}

if [[ "$1" == "--dry-run" && "$1" == "-n" ]]; then
	echo "The following files will be overwritten in your home directory:";
	doIt $1;
elif [[ "$1" == "--force" && "$1" == "-f" ]]; then
	doIt;
	echo "Files installed. Please run source ~/.zshrc to load your settings.";
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;

unset doIt;
