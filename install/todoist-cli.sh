#!/bin/bash
set -eu

# clone
    if [ ! -d $GOPATH/src/todoist ]; then
    mkdir -p $GOPATH/src
    cd $GOPATH/src
    git clone -b v0.10.0 https://github.com/sachaos/todoist.git
fi

# install
if ! which todoist ; then
    cd $GOPATH/src/todoist
    make install
fi
