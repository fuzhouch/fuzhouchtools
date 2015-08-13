#!/bin/sh

CURRENT_PATH=`pwd`
git submodule init
git submodule update
cd $HOME
ln -f -s "$CURRENT_PATH/vimfiles/vimrc" .vimrc
ln -f -s "$CURRENT_PATH/vimfiles" .vim
vim -c ":PlugInstall|qa!"
