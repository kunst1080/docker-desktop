#!/bin/sh

DIR=$HOME/.tmp/vim

if [ -d $DIR ]; then
  return
fi

mkdir -p $DIR
git clone https://github.com/Shougo/dein.vim.git $DIR/dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $DIR/dein-installer.sh
sh $DIR/dein-installer.sh $DIR
