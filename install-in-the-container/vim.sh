#!/bin/sh

if [ -d ~/local/.vim ]; then
  return
fi

mkdir -p ~/local/.vim
git clone http://github.com/gmarik/vundle.git ~/local/.vim/vundle.git
