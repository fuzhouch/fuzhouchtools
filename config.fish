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
        set --export PATH $HOME/go/bin $PATH
    else
        set --export PATH $GOPATH/bin $PATH
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

# For K8S use - Use Aliyun's image instead of global one to avoid being
# blocked in China.
function startminikube
    minikube start --registry-mirror=https://registry.docker-cn.com
end

function rm
    command rm -i $argv
end

function cp
    command cp -i $argv
end

function mv
    command mv -i $argv
end
