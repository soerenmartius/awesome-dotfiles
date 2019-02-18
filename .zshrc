#!/usr/bin/env zsh

# fixing oh-my-zsh sudo issue https://github.com/robbyrussell/oh-my-zsh/issues/6835
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
  zgen oh-my-zsh plugins/osx
  zgen oh-my-zsh plugins/urltools
  zgen oh-my-zsh plugins/command-not-found
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/golang
  zgen oh-my-zsh plugins/terraform
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/command-not-found

  # plugins
  zgen loadall <<EOPLUGINS
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-completions src
    zsh-users/zsh-autosuggestions
    hlissner/zsh-autopair
    zsh-users/history-substring-search
EOPLUGINS

  # theme
  zgen load bhilburn/powerlevel9k powerlevel9k

  # generate the init script from plugins above
  zgen save
fi

# automatically upgrade oh-my-zsh without asking
DISABLE_UPDATE_PROMPT=true

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{theme,path,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
