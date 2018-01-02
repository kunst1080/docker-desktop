#!/bin/bash

set -euv

FILE=slack-desktop-3.0.2-amd64.deb

sudo apt update
sudo apt install gconf2 gvfs-bin libgnome-keyring0 gir1.2-gnomekeyring-1.0

cd ~/local/make
wget "https://downloads.slack-edge.com/linux_releases/$FILE"
sudo dpkg -i $FILE
