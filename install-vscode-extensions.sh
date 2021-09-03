#!/bin/bash

#########################################################
# Execute Script
# curl -s https://raw.githubusercontent.com/soerenmartius/awesome-dotfiles/master/install-vscode-extensions.sh | /bin/bash
#########################################################
vsc="$(which code || which codium)"

extensions=(
    aaron-bond.better-comments
    asvetliakov.vscode-neovim
    bierner.lit-html
    bradlc.vscode-tailwindcss
    bungcip.better-toml
    christian-kohler.path-intellisense
    CodeStream.codestream
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
    henriiik.vscode-sort
    heybourn.headwind
    humao.rest-client
    johnsoncodehk.volar
    kamikillerto.vscode-colorize
    ms-azuretools.vscode-docker
    ms-python.python
    ms-python.vscode-pylance
    ms-toolsai.jupyter
    ms-vscode.azure-account
    ms-vsliveshare.vsliveshare
    msjsdiag.debugger-for-chrome
    oderwat.indent-rainbow
    pascalsenn.keyboard-quickfix
    PKief.material-icon-theme
    pranaygp.vscode-css-peek
    redhat.vscode-yaml
    ritwickdey.LiveServer
    rogalmic.bash-debug
    rustlang.rust
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
