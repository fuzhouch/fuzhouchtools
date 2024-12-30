@echo off
set CheckoutDir=%~dp0
git submodule init
git submodule update
if exist "%UserProfile%\vimfiles" ( rmdir "%UserProfile%\vimfiles" )
if exist "%UserProfile%\.vim" ( rmdir "%UserProfile%\.vim" )
if exist "%UserProfile%\.vimrc" ( del /f "%UserProfile%\.vimrc" )
if exist "%LOCALAPPDATA%\nvim\init.vim" ( del /f "%LOCALAPPDATA%\nvim\init.vim" )
if exist "%LOCALAPPDATA%\nvim" ( rmdir "%LOCALAPPDATA%\nvim" )
if exist "%UserProfile%\ctags.cnf" ( del /f "%UserProfile%\ctags.cnf" )
if exist "%APPDATA%\nushell\config.nu" ( del /f "%LOCALAPPDATA%\nushell\config.nu" )

if not exist "%APPDATA%\nushell" ( mkdir "%APPDATA%\nushell" )

mklink /J "%UserProfile%\vimfiles" "%CheckoutDir%vimfiles"
mklink /H "%UserProfile%\vimfiles\autoload\plug.vim" "%UserProfile%\vimfiles\bundle\vim-plug\plug.vim"
mklink /J "%UserProfile%\.vim" "%CheckoutDir%vimfiles"
mklink /H "%UserProfile%\.vimrc" "%CheckoutDir%vimfiles\vimrc"
mklink /J "%LOCALAPPDATA%\nvim" "%CheckoutDir%vimfiles"
mklink /H "%LOCALAPPDATA%\nvim\init.vim" "%CheckoutDir%vimfiles\vimrc"
mklink /H "%UserProfile%\ctags.cnf" "%CheckoutDir%ctags.cnf"
mklink /H "%APPDATA%\nushell\config.nu" "%CheckoutDir%config.nu"
gvim -c ":PlugInstall|qa!"
