#!/usr/bin/env bash

# Install command-line tools, apps and fonts using Homebrew.
# Everything in here is installed on my machines; run it top to bottom on a
# fresh Mac after installing Homebrew, or cherry-pick.

# Turn off analytics
brew analytics off

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Homebrew 7 ignores third-party taps until they are trusted. Trust exactly the
# formulae and casks this script installs from them (older brews lack the command).
brew trust --formula \
	bramstein/webfonttools/sfnt2woff \
	c-bata/kube-prompt/kube-prompt ekristen/tap/aws-nuke golangci/tap/golangci-lint \
	hashicorp/tap/packer hashicorp/tap/terraform-ls openresty/brew/openresty \
	sergiobenitez/osxct/x86_64-unknown-linux-gnu supabase/tap/supabase \
	withgraphite/tap/graphite to11ai/tap/to11 2>/dev/null || true
brew trust --cask entireio/tap/entire ramonvermeulen/whosthere/whosthere 2>/dev/null || true

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
brew install pinentry-mac

# Neovim (config lives in .config/nvim, based on AstroNvim)
brew install neovim

# Install more recent versions of some macOS tools.
brew install grep
brew install openssh
brew install screen
brew install gmp
brew install curl
brew install rsync
brew install telnet
brew install netcat

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
# sfnt2woff-zopfli no longer loads under Homebrew 7 (its tap formula needs Ruby's removed base64 gem)
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
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz
# hashpump and tcptrace were removed from Homebrew

# Install other useful binaries.
brew install ack
brew install git
brew install git-xargs
brew install git-lfs
brew install gh                  # GitHub CLI; also the git credential helper in .gitconfig
brew install hub
brew install lazygit
brew install imagemagick
brew install ghostscript
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install watch
brew install wrk
brew install sslscan
brew install peco
brew install fzf
brew install fdupes
brew install ffmpeg
brew install graphviz
brew install jq
brew install htop
brew install asitop              # Apple Silicon `top`
brew install cmatrix             # The most important command ever

# Terminal & shell workflow (see .tmux.conf and .local/bin/tmux-work)
brew install --cask ghostty
brew install tmux
brew install tmuxinator
brew install pam-reattach        # Touch ID for sudo inside tmux, see README
# tmate and zopfli are deprecated upstream; still installed on my machines but not worth a fresh install
brew install asciinema
brew install agg                 # asciinema gif generator
brew install direnv              # direnv for managing .envrc based environments
brew install zoxide              # smarter cd
brew install atuin               # searchable, syncable shell history

# Languages, runtimes & build tools
# asdf is not installed via Homebrew but cloned into ~/.asdf by bootstrap.sh
brew install go
brew install rustup
brew install python@3.14
brew install pipx
brew install lua
brew install luajit
brew install luarocks
brew install luacheck
brew install elixir              # elixir programming language
brew install deno
brew install openjdk@17
brew install openjdk@21
brew install gradle
brew install cmake
brew install ninja
brew install boost
brew install libmagic
brew install protobuf
brew install readline
brew install openssl@3
brew install just                # command runner
brew install pre-commit
brew install rbenv
brew install wasmer
brew install k6

# Linters & formatters
brew install shellcheck          # shellcheck shell/bash linter
brew install yamllint            # yamllint YAML linter
brew install hadolint            # Dockerfile linter
brew install actionlint          # GitHub Actions workflow linter
brew install markdownlint-cli
brew install vale                # prose linter
brew install vint                # vimscript linter
brew install black

# Data & services
brew install libpq               # install postgres tools without installing full postgres
brew install redis
brew install ripgrep             # ripgrep recursively searches directories for a regex pattern
brew install websocat            # websocat
brew install mkcert              # locally-trusted TLS certificates
brew install cosign              # sign and verify container images
brew install sshuttle            # poor man's VPN over ssh

# Cloud & infrastructure
brew install --cask gcloud-cli
brew install awscli
brew install --cask aws-vault
brew install --cask aws-vault-binary
brew install azure-cli
brew install cloudflared
brew install ansible
brew install hashicorp/tap/packer
brew install hashicorp/tap/terraform-ls
brew install opentofu
brew install terragrunt
brew install infracost
brew install inframap
brew install pulumi
brew install neonctl
brew install nixpacks
brew install solana
brew install supabase/tap/supabase
brew install ekristen/tap/aws-nuke
brew install withgraphite/tap/graphite
brew install golangci/tap/golangci-lint
# openresty builds from source and currently fails on Apple Silicon (its GeoIP module
# needs a library Homebrew no longer ships, openresty/homebrew-brew#53). Installed
# machines keep the working 1.29 via `brew pin openresty`.
brew install openresty/brew/openresty || true
brew install sergiobenitez/osxct/x86_64-unknown-linux-gnu   # Linux cross toolchain

# Kubernetes
brew install kubernetes-cli                 # kubectl
brew install kubectx                        # faster way to switch between clusters and namespaces
brew install helm                           # helm kubernetes package manager
brew install k9s                            # Kubernetes CLI To Manage Your Clusters In Style!
brew install c-bata/kube-prompt/kube-prompt # kubectl prompt
brew install --cask lens                    # A Kubernetes IDE

# Containers
brew install --cask docker-desktop

# AI tooling
brew install ollama
brew install goose
brew install opencode
brew install --cask codex
brew install --cask chatgpt
brew install --cask 1password-cli
brew install to11ai/tap/to11

# Tunnels & networking
brew install --cask ngrok # ngrok secure introspectable tunnels to localhost
brew install --cask packetsender
brew install --cask little-snitch

# Python environment manager
brew install --cask miniconda

# Nerd fonts
brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | xargs -I{} brew install --cask {} || true
brew install --cask font-fira-code

# Editors & terminals
brew install --cask visual-studio-code
brew install --cask warp
brew install --cask wave
brew install --cask cmux

# Dev GUIs
brew install --cask postman
brew install --cask mongodb-compass
brew install --cask medis
brew install --cask gpg-suite
brew tap entireio/tap
brew install --cask entire

# macOS quality of life
brew install --cask stats                   # Awesome stats in top menu bar
brew install --cask monitorcontrol          # https://github.com/MonitorControl/MonitorControl
brew install --cask betterdisplay
brew install --cask balance-lock            # Automatically lock headphone balance
brew install --cask jordanbaird-ice         # menu bar manager
brew install --cask meetingbar
brew tap ramonvermeulen/whosthere
brew install --cask whosthere
brew install --cask rectangle
brew install --cask spectacle
brew install --cask alfred
brew install --cask iina
brew install --cask elgato-control-center
# flameshot, gstreamer-runtime, redis-pro and wine-stable are disabled upstream and no longer installable

# Communication
brew install --cask slack
brew install --cask discord
brew install --cask zoom

# Productivity & browsers
brew install --cask arc
brew install --cask tor-browser
brew install --cask todoist-app
brew install --cask notion
brew install --cask obsidian
brew install --cask miro

# Mac App Store apps (requires being signed in to the App Store)
mas install 975937182   # Fantastical
mas install 409183694   # Keynote
mas install 409203825   # Numbers
mas install 409201541   # Pages
mas install 1551335606  # Pitch
mas install 747648890   # Telegram
mas install 310633997   # WhatsApp
mas install 1446377255  # Menu World Time
mas install 1378587993  # SQLiteFlow
mas install 1295203466  # Windows App
mas install 1491764008  # Red
mas install 571213070   # DaVinci Resolve
mas install 408981434   # iMovie
mas install 682658836   # GarageBand
mas install 545519333   # Prime Video

# Remove outdated versions from the cellar.
brew cleanup
