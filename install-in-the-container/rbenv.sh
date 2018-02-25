#!/bin/sh

set -euv

sudo apt update -y
sudo apt install -y libssl-dev libreadline-dev zlib1g-dev

#DIR=$HOME/.rbenv
DIR=$HOME/.tmp/rbenv

# download
if [ ! -d $DIR ]; then
  git clone https://github.com/sstephenson/rbenv.git $DIR
  git clone https://github.com/sstephenson/ruby-build.git $DIR/plugins/ruby-build
fi

# build and install
if /usr/bin/which rbenv > /dev/null ; then
  PATH=$DIR/bin:$PATH
  eval "$(rbenv init -)"
  rbenv install -v 2.4.1
  rbenv rehash
  rbenv global 2.4.1
fi
