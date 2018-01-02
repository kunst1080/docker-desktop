#!/bin/bash

set -euv
DEBIAN_FRONTEND=noninteractive 

FILE=slack-desktop-3.0.2-amd64.deb

apt-get update
apt-get install -y \
    gconf2 \
    gvfs-bin \
    libgnome-keyring0 \
    gir1.2-gnomekeyring-1.0
rm -rf /var/lib/apt/lists/*
wget -q -O /tmp/$FILE "https://downloads.slack-edge.com/linux_releases/$FILE"
dpkg -i /tmp/$FILE
rm /tmp/$FILE
