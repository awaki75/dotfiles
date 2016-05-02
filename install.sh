#!/bin/bash

while getopts m:n:s opt; do
  case $opt in
    m) mail="$OPTARG" ;;
    n) name="$OPTARG" ;;
    s) enabled_sudo=true ;;
    *) exit 1 ;;
  esac
done

: "sudo" && {
  if [ $enabled_sudo ]; then
    sudo apt-get -y install git vim-nox zsh
    sudo chsh -s /bin/zsh $USER
  else
    hash git vim zsh || exit 1
  fi
}

: "install Oh My Zsh" && {
  if [ ! -d ~/.oh-my-zsh ]; then
    curl -s https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
  fi
}

: "install NeoBundle" && {
  if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
    curl -s https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
  fi
}

: "place dotfiles" && {
  base="https://raw.githubusercontent.com/awaki75/dotfiles/master"
  files=(
    ".gitattributes"
    ".oh-my-zsh/custom/themes/mine.zsh-theme"
    ".vimrc"
    ".zshrc"
  )
  for file in ${files[@]}; do
    [ "$file" != "${file%/*}" ] && mkdir -p "~/${file%/*}"
    curl -s "$base/$file" -o "~/$file"
  done
}

: "configure Git" && {
  [ -n "$mail" ] && git config --global user.email $mail
  [ -n "$name" ] && git config --global user.name $name
  git config --global color.ui auto
  git config --global core.attributesfile ~/.gitattributes
  git config --global core.editor vim
}

exit 0
