#!/bin/sh

CURRENT_PATH=`pwd`
git submodule init
git submodule update
cd $HOME
ln -f -s "$CURRENT_PATH/vimfiles/vimrc" .vimrc
ln -f -s "$CURRENT_PATH/vimfiles" .vim
ln -f -s "$HOME/.vim/bundle/vim-plug/plug.vim" "$HOME/.vim/autoload/plug.vim"
vim -c ":PlugInstall|qa!"
