#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Turn off analytics
brew analytics off

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# Install ZSH and zsh-completions
brew install zsh
brew install zsh-completions

# Install Starship Prompt https://github.com/starship/starship
brew install starship

# Install Mac App Store command line interface
brew install mas

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# The neovim brew package is outdated, so we install the latest master
# Note: This can be broken and should be set to a stable version once the
# brew package is updated
brew install --HEAD neovim

# Install more recent versions of some macOS tools.
brew install grep
brew install openssh
brew install screen
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups-2017.
brew install wireshark
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
brew install git
brew install git-xargs
brew install git-lfs
brew install imagemagick
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli
brew install watch
brew install wrk
brew install sslscan
brew install peco
brew install gs
brew install fzf

# Cloud Provider
brew install --cask google-cloud-sdk
brew install awscli

# Development
brew install tmux
brew install tmuxinator
brew install alacritty

brew install lua
brew install luajit
brew install openresty/brew/openresty
brew install ninja # Ninja for Lua
brew install k6
brew install wasmer
brew install ansible
brew install asdf
brew install protobuf
brew install direnv # direnv for managing .envrc based environments
brew install go
brew install htop
brew install hub
brew install jq
brew install openssl
brew install packer
brew install pre-commit
brew install python3
brew install readline
brew install rsync
brew install telnet
brew install netcat
brew install tmate               # https://tmate.io/ Instant terminal sharing
brew install websocat            # websocat
brew install ripgrep             # ripgrep recursively searches directories for a regex pattern
brew install libpq               # install postgres tools without installing full postgres
brew install elixir              # elixir programming language
brew install --cask lens         # Lens GUI for kubernetes
brew install helm                # helm kubernetes package manager
brew install shellcheck          # shellcheck shell/bash linter
brew install yamllint            # yamllint YAML linter
brew install github/gh/gh        # github cli
brew install nektos/tap/act      # test github actions locally

# Kubernetes
brew install kubectl                        # kubernetes cli
brew install c-bata/kube-prompt/kube-prompt # kubectl prompt
brew install kubectx                        # faster way to switch between clusters and namespaces
brew install --cask lens                    # A Kubernetes IDE
brew install k9s                            # Kubernetes CLI To Manage Your Clusters In Style!

brew install --cask ngrok # ngrok secure introspectable tunnels to localhost

# Golangci-lint
brew install golangci/tap/golangci-lint

# Miniconda python environment manager
brew install --cask miniconda

# Java 11
brew tap homebrew/cask-versions
brew install --cask java

# Spectacle
brew install --cask spectacle

# Automatically lock headphone balance
brew install --cask balance-lock

# Packetsender
brew install --cask packetsender

# Aws-vault
brew install --cask aws-vault

# Nerds-font
brew install --cask font-hack-nerd-font
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

# MonitorControl https://github.com/MonitorControl/MonitorControl
brew install --cask monitorcontrol

# Communication
brew install --cask slack
brew install --cask discord

# Remove outdated versions from the cellar.
brew cleanup
