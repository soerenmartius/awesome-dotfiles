#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

git pull origin master

# check if zsh is installed
if ! type zsh &>/dev/null; then
	echo "Zsh isn't installed. Please install zsh first or run brew.sh if you are on macOS."
fi

# install zgen plugin manager
if ! [ -d "${HOME}/.zgen" ]; then
	git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
else
	echo "Skipping: ${HOME}/.zgen exists. Seems like zgen is already installed!"
fi

# install tpm (tmux plugin manager); .tmux.conf loads tmux-resurrect and tmux-continuum through it
if ! [ -d "${HOME}/.tmux/plugins/tpm" ]; then
	git clone https://github.com/tmux-plugins/tpm.git "${HOME}/.tmux/plugins/tpm"
else
	echo "Skipping: ${HOME}/.tmux/plugins/tpm exists. Seems like tpm is already installed!"
fi

# install asdf (git install, pinned to the version running on my machines); manages .tool-versions
if ! [ -d "${HOME}/.asdf" ]; then
	git clone https://github.com/asdf-vm/asdf.git "${HOME}/.asdf" --branch v0.11.3
else
	echo "Skipping: ${HOME}/.asdf exists. Seems like asdf is already installed!"
fi

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".github/" \
		--exclude ".DS_Store" \
		--exclude ".idea" \
		--exclude ".macos" \
		--exclude "brew.sh" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE" \
		--exclude "CODEOWNERS" \
		--exclude "install-dnssec.sh" \
		--exclude ".dnssec" \
		--exclude ".vscode" \
		--exclude ".iterm" \
		--exclude ".extra" \
		-avh $1 --no-perms . ~
}

function postInstall() {
	# ssh refuses to use a world-readable ~/.ssh
	chmod 700 "${HOME}/.ssh"
	# install or update the tmux plugins declared in .tmux.conf
	if command -v tmux &>/dev/null && [ -x "${HOME}/.tmux/plugins/tpm/bin/install_plugins" ]; then
		"${HOME}/.tmux/plugins/tpm/bin/install_plugins"
	fi
	echo "Files installed. Please run source ~/.zshrc to load your settings."
}

if [[ "$1" == "--dry-run" || "$1" == "-n" ]]; then
	echo "The following files will be overwritten in your home directory:"
	doIt -n
elif [[ "$1" == "--force" || "$1" == "-f" ]]; then
	doIt
	postInstall
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
		postInstall
	fi
fi

unset doIt postInstall
