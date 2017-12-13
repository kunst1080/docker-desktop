#!/bin/bash
mkdir .config
git clone git@github.com:kunst1080/dotfiles.git && ./dotfiles/links.sh
git clone git@github.com:kunst1080/dotfiles-i3.git && ./dotfiles-i3/links.sh
exec startx
