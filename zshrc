#!/usr/bin/env zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT='%F{yellow}%n%F{blue}@%F{green}%m %F{blue}%1~%f %# '

# Ported from bash settings
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

if [ `uname -s` = 'Linux' ]; then
    alias ls="ls -F --color"
elif [ `uname -s` = 'Darwin' ]; then
    alias ls="ls -F -G"
else
    # Do nothing
fi

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# For Rust
export PATH=$HOME/.cargo/bin:$PATH

# For NPM/NodeJS
export NODE_PATH="/usr/local/lib/node_modules"
export npm_config_prefix=$HOME/.local/npm
export PATH=$npm_config_prefix/bin:$PATH


# For GO
# Quick preparation for Golang
alias g='export GOPROXY=https://goproxy.cn,direct'
if [ "$GOPATH" = "" ]; then
    export PATH=$HOME/go/bin:$PATH
else
    export PATH=$GOPATH/bin:$PATH
fi
# For using Golang in China
export GOPROXY=https://goproxy.cn,direct
export GO111MODULE=on

if [ `uname -s` = 'Darwin' ]; then
    # For NPM/NodeJS
    export NODE_PATH="/usr/local/lib/node_modules"

    # Let homebrew use .curlrc to disable HTTP/2. Or Homebrew will
    # not work correctly in China.
    export HOMEBREW_CURLRC=1
fi

# Set Java by jenv
if which jenv > /dev/null; then
    # REF:
    # http://davidcai.github.io/blog/posts/install-multiple-jdk-on-mac/
    eval "$(jenv init -)"
else
    echo Startup: JEnv is not detected. Fallback to default JAVA_HOME
    if [ `uname -s` = 'Linux' ]; then
        export JAVA_HOME=/usr/lib/jvm/java-15-openjdk
    elif [ `uname -s` = 'Darwin' ]; then
        export JAVA_HOME=$(/usr/libexec/java_home)
    else
        echo No JAVA_HOME is set.
    fi
fi

export EDITOR=vim

# For using Hyper terminal
# We may see an annoying '%' shown when working with Hyper 3.
# https://github.com/ohmyzsh/ohmyzsh/issues/7832
# https://unix.stackexchange.com/questions/167582/why-zsh-ends-a-line-with-a-highlighted-percent-symbol/167600#167600
unsetopt PROMPT_SP

# In China mainland, Homebrew (on Mac) usually needs to work with
# curl with --no-apln option to allow it connects to Homebrew server
# correctly.
export HOMEBREW_CURLRC=1

# For linux specific configuration
if [ `uname -s` = 'Linux' ]; then
    # We want to use a correct global setting to enable
    # input methods.
    export LANG=zh_CN.UTF-8
    export LC_MESSAGES=en_US.UTF-8
    export LC_NUMERIC=en_US.UTF-8
    export LC_TIME=en_US.UTF-8

    # Archcraft default theme
    export ZSH=$HOME/.oh-my-zsh
    ZSH_THEME="archcraft"
    plugins=(git)
    source $ZSH/oh-my-zsh.sh
fi

# Minikube optimized to run in China.
alias startminikube='minikube start --registry-mirror=https://registry.docker-cn.com'
