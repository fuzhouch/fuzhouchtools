#!/usr/bin/env zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/cppof286/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT='[%n@%F{yellow}%m %F{green}%1~%f]%# '

# Ported from bash settings
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias ls="ls -F"

export PATH=$HOME/bin:/usr/local/bin:$PATH
# Android SDK
export ANDROID_HOME=$HOME/projects/android-sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_NDK_ROOT=$HOME/projects/android-ndk-r8b
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/projects/apache-ant-1.9.4/bin

# For Rust
export PATH=$HOME/.cargo/bin:$PATH

# export PYTHONPATH=$HOME/.pysite:$PYTHONPATH

# XXX Don't set SDKROOT. It will cause gcc in Xcode 5 not working. Seems
# Xcode 5 uses this environment variable to determine which header files
# it should look for. If it's set and point to Android, the default gcc
# will not be able to compile anything because it can't find clang.
# export NDKROOT=$HOME/projects/android-ndk-r8b
# export SDKROOT=$HOME/projects/android-sdk-mac_x86
# export PATH=$PATH:$HOME/projects/android-ndk-r8b/toolchains/arm-linux-androideabi-4.6/prebuilt/darwin-x86/bin

# Set Java by jenv
if which jenv > /dev/null; then
    # REF:
    # http://davidcai.github.io/blog/posts/install-multiple-jdk-on-mac/
    eval "$(jenv init -)"
else
    echo JEnv is not installed. Fallback to default JAVA_HOME
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

export EDITOR=nvim

export PATH="$HOME/.cargo/bin:$PATH"

export NODE_PATH="/usr/local/lib/node_modules"

# We may see an annoying '%' shown when working with Hyper 3.
# https://github.com/ohmyzsh/ohmyzsh/issues/7832
# https://unix.stackexchange.com/questions/167582/why-zsh-ends-a-line-with-a-highlighted-percent-symbol/167600#167600
unsetopt PROMPT_SP
