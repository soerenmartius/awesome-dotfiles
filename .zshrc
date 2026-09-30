#!/usr/bin/env zsh
ZSH_DISABLE_COMPFIX=true

# automatically run `zgen reset` if we modify our .zshrc
ZGEN_RESET_ON_CHANGE=("${HOME}/.zshrc")

# Extra completion functions have to be on fpath before oh-my-zsh runs compinit.
[ -d "${HOME}/.docker/completions" ] && fpath=("${HOME}/.docker/completions" $fpath)
[ -d "${HOME}/.zfunc" ] && fpath+=("${HOME}/.zfunc")

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  # oh-my-zsh
  zgen oh-my-zsh

  # oh my zsh plugins
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/command-not-found

  # plugins
  zgen loadall <<EOPLUGINS
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-completions src
    zsh-users/zsh-autosuggestions
    hlissner/zsh-autopair
    zsh-users/history-substring-search
EOPLUGINS

  # generate the init script from plugins above
  zgen save
fi

# automatically upgrade oh-my-zsh without asking
DISABLE_UPDATE_PROMPT=true

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Toolchains. Each block only activates when the tool is actually installed,
# so this file works unchanged on a fresh machine.

# asdf version manager (git install in ~/.asdf, or Homebrew)
if [ -f "$HOME/.asdf/asdf.sh" ]; then
  . "$HOME/.asdf/asdf.sh"
elif [ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ]; then
  . /opt/homebrew/opt/asdf/libexec/asdf.sh
fi
# let asdf-golang pick the Go version from go.mod
export ASDF_GOLANG_MOD_VERSION_ENABLED=true

# Rust (rustup)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# uv and other tools that install into ~/.local/bin
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# bun
if [ -d "$HOME/.bun" ]; then
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
  [ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"
fi

# Java (brew install openjdk@21)
if [ -d /opt/homebrew/opt/openjdk@21 ]; then
  export JAVA_HOME=/opt/homebrew/opt/openjdk@21
  export PATH="$JAVA_HOME/bin:$PATH"
fi

# curl from Homebrew instead of the macOS one
[ -d /opt/homebrew/opt/curl/bin ] && export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# Google Cloud SDK (brew install --cask gcloud-cli)
if [ -f /opt/homebrew/share/google-cloud-sdk/path.zsh.inc ]; then
  . /opt/homebrew/share/google-cloud-sdk/path.zsh.inc
  . /opt/homebrew/share/google-cloud-sdk/completion.zsh.inc
fi

# Miniconda (brew install --cask miniconda). Same effect as the block `conda init` appends.
if [ -f /opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh ]; then
  . /opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh
fi

# Windsurf
[ -d "$HOME/.codeium/windsurf/bin" ] && export PATH="$HOME/.codeium/windsurf/bin:$PATH"

# Ruby (brew install rbenv)
command -v rbenv >/dev/null && eval "$(rbenv init - zsh)"

# Shell productivity
# fzf: Ctrl-T picks files, Alt-C jumps to a directory (Ctrl-R is taken over by atuin below)
command -v fzf >/dev/null && source <(fzf --zsh)
# zoxide: `z <part of a path>` jumps to the directory you use most
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
# atuin: Ctrl-R becomes a searchable, cross-machine shell history (`atuin register` / `atuin login` to sync)
command -v atuin >/dev/null && eval "$(atuin init zsh --disable-up-arrow)"

# Bash-style completion for tools that only ship a `complete -C` handler
autoload -U +X bashcompinit && bashcompinit
for tool in terraform terramate; do
  command -v "$tool" >/dev/null && complete -o nospace -C "$(command -v "$tool")" "$tool"
done
unset tool

# get direnv working with zsh https://github.com/direnv/direnv/issues/64
eval "$(direnv hook $SHELL)"

# Use Starship Prompt
# https://github.com/starship/starship
export STARSHIP_CONFIG=~/.starship.toml
eval "$(starship init $SHELL)"

# Stamp every new interactive Claude Code session with an explicit session ID.
# The ID ends up in the pane's command line, so tmux-resurrect (through
# ~/.local/bin/claude-resurrect) can resume exactly that conversation after a
# reboot instead of guessing with --continue. Subcommands, explicit resumes and
# one-off flags pass through untouched.
claude() {
  case "$1" in
    agents|attach|auth|auto-mode|doctor|gateway|import|install|logs|mcp|plugin|plugins|project|respawn|rm|setup-token|stop|kill|ultrareview|update|upgrade)
      command claude "$@"; return ;;
  esac
  case " $* " in
    *" -c "*|*" --continue "*|*" -r "*|*" --resume "*|*|*" --session-id "*|*" --fork-session "*|*" -p "*|*" --print "*|*" -h "*|*" --help "*|*" -v "*|*" --version "*)
      command claude "$@" ;;
    *)
      command claude --session-id "$(uuidgen | tr '[:upper:]' '[:lower:]')" "$@" ;;
  esac
}
