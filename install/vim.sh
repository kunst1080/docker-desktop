#!/bin/sh

if [ -d ~/.vim ]; then
  return
fi

mkdir -p ~/.vim
mkdir -p ~/.vim/tmp ~/.vim/undo

git clone http://github.com/gmarik/vundle.git ~/.vim/vundle.git
