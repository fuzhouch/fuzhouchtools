#!/usr/bin/env fish

if status --is-login
    # My own code first
    set --export PATH $HOME/bin $PATH
    # Local bin always have higher priority than system default
    set --export PATH /usr/local/bin $PATH
    # For NPM and installed Python module in local folder.
    set --export PATH $HOME/.local/bin $PATH
    # For Rust
    set --export PATH $HOME/.cargo/bin $PATH
    # For golang
    if set -q GOPATH
        set --export PATH $GOPATH/bin $PATH
    else
        set --export PATH $HOME/go/bin $PATH
    end
    # For NPM
    set --export npm_config_prefix $HOME/.local/npm
    set --export PATH $npm_config_prefix/bin $PATH
end

# For use in China mainlang
set --export GOPROXY https://goproxy.cn,direct
# For Mac: Homebrew needs --no-apln enabled to make sure it works in
# China network.
set --export HOMEBREW_CURLRC 1

set --export EDITOR vim

set --export JAVA_HOME /usr/lib/jvm/default

set --export GTK_IM_MODULE "ibus"
set --export XMODIFIERS    "@im=ibus"
set --export QT_MODULE     "ibus"
set --export MOZ_GTK_TITLEBAR_DECORATION "client"
set --export MOZ_ENABLE_WAYLAND "1"

# For K8S use - Use Aliyun's image instead of global one to avoid being
# blocked in China.
alias rm "rm -i"
alias cp "cp -i"
alias rm "rm -i"
alias nv "nvim-gtk"
alias spx "export https_proxy=http://127.0.0.1:8080/ && export http_proxy=http://127.0.0.1:8080/"

# Set color scheme to Tomorrow Night
set -U fish_color_normal normal
set -U fish_color_command 99cc99
set -U fish_color_quote ffcc66
set -U fish_color_end cc99cc
set -U fish_color_error f2777a
set -U fish_color_match 6699cc
set -U fish_color_redirection d3d0c8
set -U fish_color_param d3d0c8
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 6699cc
set -U fish_color_escape 66cccc
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 747369
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_comment ffcc66
