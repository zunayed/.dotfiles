#!/bin/bash

echo "syning dotfiles"

# Dotfiles
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

# Vim 
mkdir -p ~/.vim/colors/
ln -s ~/.dotfiles/.vim/colors/molokai.vim ~/.vim/colors/molokai.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
vim +GoInstallBinaries +qall
yes | ~/.vim/bundle/YouCompleteMe/install.sh


