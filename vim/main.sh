#!/usr/bin/env bash

echo "- Vundle (~/.vim/bundle/Vundle.vim)"

if [ -d "~/.vim/bundle/Vundle.vim" ]; then
    : # Vundle already installed
else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "- Vim (~/.vimrc)"

cp -f "$(dirname "$0")/vimrc.vimrc" ~/.vimrc
vim +PluginInstall +qall