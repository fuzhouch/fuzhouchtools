@echo off
set CheckoutDir=%~dp0
git submodule init
git submodule update
if exist "%UserProfile%\vimfiles" ( rmdir "%UserProfile%\vimfiles" )
if exist "%UserProfile%\.vim" ( rmdir "%UserProfile%\.vim" )
if exist "%UserProfile%\.vimrc" ( del /f "%UserProfile%\.vimrc" )
mklink /J "%UserProfile%\vimfiles" "%CheckoutDir%vimfiles"
mklink /J "%UserProfile%\.vim" "%CheckoutDir%vimfiles"
mklink /H "%UserProfile%\.vimrc" "%CheckoutDir%vimfiles\vimrc"
mklink /H "%UserProfile%\vimfiles\autoload\plug.vim" "%UserProfile%\vimfiles\bundle\vim-plug\plug.vim"
gvim -c ":PlugInstall|qa!"
