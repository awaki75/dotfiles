#!/bin/bash

hash curl git tmux zsh || exit

[ -d ~/.zplug ] || curl -sL zplug.sh/installer | zsh

for name in .gitattributes .gitignore .tmux.conf .vimrc .zshrc; do
    curl -sLS "https://raw.githubusercontent.com/awaki75/dotfiles/master/$name" -o ~/$name
done

git config --global color.ui auto
git config --global core.attributesfile ~/.gitattributes
git config --global core.editor vim
git config --global core.excludesfile ~/.gitignore
