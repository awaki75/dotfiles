#!/bin/bash

apt-get update
apt-get -y install software-properties-common
add-apt-repository -y ppa:neovim-ppa/unstable
apt-get update
apt-get -y install git neovim python3-pip tmux zsh

update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
