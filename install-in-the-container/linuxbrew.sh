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
brew install go

brew tap sachaos/todoist
brew install todoist
