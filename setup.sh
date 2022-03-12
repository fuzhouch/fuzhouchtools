#!/bin/sh

CURRENT_PATH=`pwd`
git submodule init
git submodule update

rm -f $HOME/.vim
rm -f $HOME/.vimrc
rm -f $HOME/.local/share/nvim/site

mkdir -p $HOME/.vim/autoload
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/nvim/syntax
mkdir -p $HOME/.local/share/nvim
mkdir -p $HOME/.config/vis

ln -f -s "$CURRENT_PATH/vimfiles" $HOME/.vim
ln -f -s "$CURRENT_PATH/vimfiles" $HOME/.local/share/nvim/site

ln -f -s "$CURRENT_PATH/vimfiles/vimrc" $HOME/.vimrc
ln -f -s "$CURRENT_PATH/vimfiles/vimrc" "$HOME/.config/nvim/init.vim"
ln -f -s "$CURRENT_PATH/vimfiles/ginit.vim" "$HOME/.config/nvim/ginit.vim"

ln -f -s "$HOME/.vim/bundle/vim-plug/plug.vim" "$HOME/.vim/autoload/plug.vim"

# Link syntax files.
ln -f -s "$CURRENT_PATH/vimfiles/syntax/bond.vim" "$HOME/.config/nvim/syntax/bond.vim"

VIM_INSTALLED=`which vim`
NVIM_INSTALLED=`which nvim`

# NVIM should put first for its async installation is faster.
if [ ! "$NVIM_INSTALLED" = "" ]; then
    nvim -c ":PlugInstall|qa!"
fi

if [ ! "$VIM_INSTALLED" = "" ]; then
    vim -c ":PlugInstall|qa!"
fi

ln -f -s "$CURRENT_PATH/ctags.cnf" $HOME/.ctags
ln -f -s "$CURRENT_PATH/config.fish" "$HOME/.config/fish/config.fish"
ln -f -s "$CURRENT_PATH/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
ln -f -s "$CURRENT_PATH/fonts.conf" "$HOME/.config/fontconfig/fonts.conf"

# For vis configuration
ln -f -s "$CURRENT_PATH/visrc.lua" "$HOME/.config/vis/visrc.lua"
