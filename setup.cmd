@echo off
set CheckoutDir=%~dp0
git submodule init
git submodule update
if exist "%UserProfile%\vimfiles" ( rmdir "%UserProfile%\vimfiles" )
if exist "%UserProfile%\.vimrc" ( del /f "%UserProfile%\.vimrc" )
mklink /J "%UserProfile%\vimfiles" "%CheckoutDir%vimfiles"
mklink /H "%UserProfile%\.vimrc" "%CheckoutDir%vimfiles\vimrc"
gvim -c ":PlugInstall|qa!"
