#!/bin/sh

CURRENT_PATH=`pwd`
git submodule init
git submodule update

rm -f $HOME/.vim
rm -f $HOME/.vimrc
rm -f $HOME/.local/share/nvim/site

mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.local/share/nvim

ln -f -s "$CURRENT_PATH/vimfiles" $HOME/.vim
ln -f -s "$CURRENT_PATH/vimfiles" $HOME/.local/share/nvim/site

ln -f -s "$CURRENT_PATH/vimfiles/vimrc" $HOME/.vimrc
ln -f -s "$CURRENT_PATH/vimfiles/vimrc" "$HOME/.config/nvim/init.vim"

ln -f -s "$HOME/.vim/bundle/vim-plug/plug.vim" "$HOME/.vim/autoload/plug.vim"


VIM_INSTALLED=`which vim`
NVIM_INSTALLED=`which nvim`

if [ ! "$VIM_INSTALLED" = "" ]; then
    vim -c ":PlugInstall|qa!"
fi

if [ ! "$NVIM_INSTALLED" = "" ]; then
    nvim -c ":PlugInstall|qa!"
fi

ln -f -s "$CURRENT_PATH/ctags.cnf" $HOME/.ctags
