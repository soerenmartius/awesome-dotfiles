#!/bin/bash\

#########################################################
# Execute Script
# curl -s foofaa/install-vscode-extensions.sh | /bin/bash
#########################################################
vsc="$(which code)"

extensions=(
bungcip.better-toml
CoenraadS.bracket-pair-colorizer-2
donjayamanne.githistory
eamodio.gitlens
Equinusocio.vsc-community-material-theme
Equinusocio.vsc-material-theme
equinusocio.vsc-material-theme-icons
esbenp.prettier-vscode
formulahendry.auto-rename-tag
formulahendry.code-runner
humao.rest-client
kamikillerto.vscode-colorize
letmaik.git-tree-compare
mauve.terraform
mjmcloug.vscode-elixir
ms-azuretools.vscode-docker
ms-python.python
ms-vsliveshare.vsliveshare
oderwat.indent-rainbow
PKief.material-icon-theme
pranaygp.vscode-css-peek
quicktype.quicktype
rust-lang.rust
serayuzgur.crates
shardulm94.trailing-spaces
SimonSiefke.svg-preview
vscodevim.vim
wholroyd.HCL
yzhang.markdown-all-in-one
redhat.vscode-yaml
)

for i in ${extensions[@]}; do
    $vsc --install-extension $i
done