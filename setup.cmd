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
if exist "%APPDATA%\helix\config.toml" ( del /f "%LOCALAPPDATA%\helix/config.toml" )
if exist "%APPDATA%\helix\languages.toml" ( del /f "%LOCALAPPDATA%\helix\languages.toml" )
if exist "%APPDATA%\zed\settings.json" ( del /f "%LOCALAPPDATA%\zed\settings.json" )

if not exist "%APPDATA%\nushell" ( mkdir "%APPDATA%\nushell" )
if not exist "%APPDATA%\helix" ( mkdir "%APPDATA%\helix" )
if not exist "%APPDATA%\zed" ( mkdir "%APPDATA%\zed" )

mklink /J "%UserProfile%\vimfiles" "%CheckoutDir%vimfiles"
mklink /H "%UserProfile%\vimfiles\autoload\plug.vim" "%UserProfile%\vimfiles\bundle\vim-plug\plug.vim"
mklink /J "%UserProfile%\.vim" "%CheckoutDir%vimfiles"
mklink /H "%UserProfile%\.vimrc" "%CheckoutDir%vimfiles\vimrc"
mklink /J "%LOCALAPPDATA%\nvim" "%CheckoutDir%vimfiles"
mklink /H "%LOCALAPPDATA%\nvim\init.vim" "%CheckoutDir%vimfiles\vimrc"
mklink /H "%UserProfile%\ctags.cnf" "%CheckoutDir%ctags.cnf"
mklink /H "%APPDATA%\nushell\config.nu" "%CheckoutDir%config.nu"
mklink /H "%APPDATA%\helix\config.toml" "%CheckoutDir%helix.config.toml"
mklink /H "%APPDATA%\helix\languages.toml" "%CheckoutDir%helix.languages.toml"
mklink /H "%APPDATA%\zed\settings.json" "%CheckoutDir%zed.settings.json"

REM Reminder: Need access to Github.com
gvim -c ":PlugInstall|qa!"
