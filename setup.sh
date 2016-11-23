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
if [ -d ~/dotfiles ]; then
    echo "  skipped"
else
    git clone https://github.com/awaki75/dotfiles.git ~/dotfiles
fi

echo "link"
mkdir -p ~/.config/nvim
cd ~
for name in .config/nvim/init.vim .tmux.conf .zshrc; do
    ln -fs "~/dotfiles/src/$name" "$name"
done

echo "configure git"
git config --global color.ui auto
git config --global core.attributesfile ~/dotfiles/src/.gitattributes
git config --global core.editor vim
git config --global core.excludesfile ~/dotfiles/src/.gitignore
git config --global push.default simple

echo "completed"
