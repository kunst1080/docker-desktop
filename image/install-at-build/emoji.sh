#!/bin/bash

set -euv

add-apt-repository ppa:eosrei/fonts
apt update
apt install -y fonts-emojione-svginot
rm -rf /var/lib/apt/lists/*
