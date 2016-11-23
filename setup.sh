#!/bin/bash

echo "check commands"
hash curl git zsh || exit

echo "install zplug"
if [ -d ~/.zplug ]; then
    echo "  skipped"
else
    curl -sL zplug.sh/installer | zsh
fi

echo "download dotfiles"
if [ -d ./dotfiles ]; then
    echo "  skipped"
else
    git clone https://github.com/awaki75/dotfiles.git ./dotfiles
fi

echo "link"
link() {
    local path=$1
    echo "  $path"
    local target=$(pwd)/dotfiles/src/$path
    if [[ $path = */* ]]; then
        local dir=~/${path%/*}
        mkdir -p $dir
        ln -fs -t $dir $target
    else
        ln -fs -t ~ $target
    fi
}
link .config/nvim/init.vim
link .tmux.conf
link .zshrc

echo "configure git"
git config --global color.ui auto
git config --global core.attributesfile $(pwd)/dotfiles/src/.gitattributes
git config --global core.editor vim
git config --global core.excludesfile $(pwd)/dotfiles/src/.gitignore
git config --global push.default simple

echo "completed"
