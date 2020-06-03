#!/bin/bash\

#########################################################
# Execute Script
# curl -s foofaa/install-vscode-extensions.sh | /bin/bash
#########################################################
vsc="$(which code)"

extensions=(
bungcip.better-toml
CoenraadS.bracket-pair-colorizer-2
DavidAnson.vscode-markdownlint
donjayamanne.githistory
eamodio.gitlens
Equinusocio.vsc-community-material-theme
Equinusocio.vsc-material-theme
equinusocio.vsc-material-theme-icons
esbenp.prettier-vscode
formulahendry.auto-rename-tag
formulahendry.code-runner
foxundermoon.shell-format
Gruntfuggly.todo-tree
humao.rest-client
kamikillerto.vscode-colorize
letmaik.git-tree-compare
mauve.terraform
mjmcloug.vscode-elixir
ms-azuretools.vscode-docker
ms-python.python
ms-vscode.Go
ms-vsliveshare.vsliveshare
oderwat.indent-rainbow
PKief.material-icon-theme
pranaygp.vscode-css-peek
quicktype.quicktype
redhat.vscode-yaml
rogalmic.bash-debug
rust-lang.rust
serayuzgur.crates
shardulm94.trailing-spaces
SimonSiefke.svg-preview
vscodevim.vim
wayou.vscode-todo-highlight
wholroyd.HCL
yzhang.markdown-all-in-one
)

for i in ${extensions[@]}; do
    $vsc --install-extension $i
done