#!/bin/bash
set -euv

sudo apt update -y
sudo apt install -y bison libx11-dev

MAKEDIR=~/local/make/xremap
[ ! -d $MAKEDIR ] && git clone https://github.com/k0kubun/xremap $MAKEDIR
cd $MAKEDIR
make
make DESTDIR=~/local/bin install
