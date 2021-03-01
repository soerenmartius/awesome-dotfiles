#!/bin/bash

#########################################################
# Execute Script
# curl -s https://raw.githubusercontent.com/soerenmartius/awesome-dotfiles/master/install-vscode-extensions.sh | /bin/bash
#########################################################
vsc="$(which code)"

extensions=(
    aaron-bond.better-comments
    asvetliakov.vscode-neovim
    bradlc.vscode-tailwindcss
    bungcip.better-toml
    christian-kohler.path-intellisense
    CoenraadS.bracket-pair-colorizer-2
    DavidAnson.vscode-markdownlint
    dbaeumer.vscode-eslint
    donjayamanne.githistory
    eamodio.gitlens
    Equinusocio.vsc-community-material-theme
    Equinusocio.vsc-material-theme
    equinusocio.vsc-material-theme-icons
    esbenp.prettier-vscode
    formulahendry.code-runner
    foxundermoon.shell-format
    GitHub.vscode-pull-request-github
    golang.go
    Gruntfuggly.todo-tree
    hashicorp.terraform
    heybourn.headwind
    humao.rest-client
    kamikillerto.vscode-colorize
    ms-azuretools.vscode-docker
    ms-python.python
    ms-toolsai.jupyter
    ms-vscode.azure-account
    ms-vsliveshare.vsliveshare
    msjsdiag.debugger-for-chrome
    octref.vetur
    oderwat.indent-rainbow
    PKief.material-icon-theme
    pranaygp.vscode-css-peek
    redhat.vscode-yaml
    ritwickdey.LiveServer
    rogalmic.bash-debug
    rust-lang.rust
    serayuzgur.crates
    shardulm94.trailing-spaces
    streetsidesoftware.code-spell-checker
    stylelint.vscode-stylelint
    VSpaceCode.whichkey
    wayou.vscode-todo-highlight
    wix.vscode-import-cost
    yzhang.markdown-all-in-one
    zhuangtongfa.material-theme
    znck.grammarly
)

for i in ${extensions[@]}; do
    $vsc --install-extension $i
done
