#!/bin/bash

hash curl git pip3 tmux zsh || exit

pip3 install neovim

[ -d ~/.zplug ] || curl -sL zplug.sh/installer | zsh

mkdir -p ~/.config/nvim

for name in .config/nvim/init.vim .gitattributes .gitignore .tmux.conf .zshrc; do
    curl -sLS "https://raw.githubusercontent.com/awaki75/dotfiles/master/$name" -o ~/$name
done

git config --global color.ui auto
git config --global core.attributesfile ~/.gitattributes
git config --global core.editor vim
git config --global core.excludesfile ~/.gitignore
git config --global push.default simple
