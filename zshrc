#!/usr/bin/env zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "/Users/$USER/.zshrc"
autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT='%F{yellow}%n%F{blue}@%F{green}%m %F{blue}%1~%f %# '

# Ported from bash settings
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias ls="ls -F -G"

# Local apps have highest priority
export PATH=$HOME/bin:/usr/local/bin:$PATH

# For Rust
export PATH=$HOME/.cargo/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"

# For Python
export PYTHONPATH=$HOME/.pysite:$PYTHONPATH

# For GO
# Quick preparation for Golang
alias g='export GOPROXY=https://goproxy.cn,direct'
if [ "$GOPATH" = "" ]; then
    export PATH=$PATH:$HOME/go/bin
else
    export PATH=$PATH:$GOPATH/bin
fi
export GO111MODULE=on
# For using Golang in China
export GOPROXY=https://goproxy.cn,direct

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
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

export EDITOR=nvim

# We may see an annoying '%' shown when working with Hyper 3.
# https://github.com/ohmyzsh/ohmyzsh/issues/7832
# https://unix.stackexchange.com/questions/167582/why-zsh-ends-a-line-with-a-highlighted-percent-symbol/167600#167600
unsetopt PROMPT_SP
