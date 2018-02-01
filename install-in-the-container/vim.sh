#!/bin/sh

if [ -d ~/local/.vim ]; then
  return
fi

mkdir -p ~/local/.vim
git clone https://github.com/Shougo/dein.vim.git ~/local/.vim/dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh ~/local/.vim/dein-installer.sh
sh ~/local/.vim/dein-installer.sh ~/local/.vim/
