#!/bin/bash

set -euv
DEBIAN_FRONTEND=noninteractive 

FILE=rescuetime_current_amd64.deb

wget -q -O /tmp/$FILE "https://www.rescuetime.com/installers/$FILE"
apt-get update -y
apt-get install -y \
    sqlite3 \
    gtk2-engines-pixbuf \
    gtk2-engines-pixbuf \
    libqt4-sql-sqlite
dpkg -i /tmp/$FILE
rm -rf /var/lib/apt/lists/*
rm /tmp/$FILE
