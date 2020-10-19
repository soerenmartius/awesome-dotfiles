#!/bin/bash

#########################################################
# Execute Script
# curl -s foofaa/install-vscode-extensions.sh | /bin/bash
#########################################################
vsc="$(which code)"

extensions=(
    aaron-bond.better-comments
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
    formulahendry.auto-rename-tag
    formulahendry.code-runner
    foxundermoon.shell-format
    GitHub.vscode-pull-request-github
    golang.go
    Gruntfuggly.todo-tree
    hashicorp.terraform
    humao.rest-client
    kamikillerto.vscode-colorize
    kretes.kretes
    letmaik.git-tree-compare
    mjmcloug.vscode-elixir
    ms-azuretools.vscode-docker
    ms-python.python
    ms-vscode.azure-account
    ms-vsliveshare.vsliveshare
    msjsdiag.debugger-for-chrome
    octref.vetur
    oderwat.indent-rainbow
    PKief.material-icon-theme
    pranaygp.vscode-css-peek
    quicktype.quicktype
    redhat.vscode-yaml
    ritwickdey.LiveServer
    rogalmic.bash-debug
    rust-lang.rust
    serayuzgur.crates
    shardulm94.trailing-spaces
    SimonSiefke.svg-preview
    streetsidesoftware.code-spell-checker
    VisualStudioExptTeam.vscodeintellicode
    vscodevim.vim
    wayou.vscode-todo-highlight
    wholroyd.HCL
    yzhang.markdown-all-in-one
)

for i in ${extensions[@]}; do
    $vsc --install-extension $i
done
