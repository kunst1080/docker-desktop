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
    imagemagick
    go
    bc
    tig
    nkf
    jq
    moreutils --without-parallel
    num-utils
    patchutils
    colordiff
    mecab
    parallel
++EOS

brew tap sachaos/todoist
brew install todoist
