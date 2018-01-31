#!/bin/sh

set -euv

DIR=$HOME/local/linuxbrew

# download
if [ ! -d $DIR ]; then
    git clone https://github.com/Linuxbrew/brew.git $DIR
    brew doctor
fi

# build and install
if ! /usr/bin/which brew > /dev/null ; then
    exit 9
fi
cat <<++EOS | xargs brew install
    zsh
    tmux
    go
    bc
    tig
    nkf
    jq
    docker
    moreutils
    num-utils
    patchutils
    colordiff
    mecab
    mecab-ipadic
    parallel --force
    jdk
    sbt
    icu4c
++EOS

brew tap sachaos/todoist
brew install todoist
