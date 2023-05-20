#!/usr/bin/env zsh
ZSH_DISABLE_COMPFIX=true

# automatically run `zgen reset` if we modify our .zshrc
ZGEN_RESET_ON_CHANGE=("${HOME}/.zshrc")

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

# get direnv working with zsh https://github.com/direnv/direnv/issues/64
eval "$(direnv hook $SHELL)"

# Use Starship Prompt
# https://github.com/starship/starship'
export STARSHIP_CONFIG=~/.starship.toml
eval "$(starship init $SHELL)"
