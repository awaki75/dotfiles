#!/bin/bash

hash curl git zsh || exit

[ -d ~/.zplug ] || curl -sL zplug.sh/installer | zsh

[ -d ~/dotfiles ] || git clone https://github.com/awaki75/dotfiles.git ~/dotfiles

mkdir -p ~/.config/nvim
cd ~

for name in .config/nvim/init.vim .tmux.conf .zshrc; do
    ln -fs "~/dotfiles/src/$name" "$name"
done

git config --global color.ui auto
git config --global core.attributesfile ~/dotfiles/src/.gitattributes
git config --global core.editor vim
git config --global core.excludesfile ~/dotfiles/src/.gitignore
git config --global push.default simple
