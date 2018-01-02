#!/bin/bash

set -euv

add-apt-repository ppa:webupd8team/atom
apt-get update
apt-get install -y atom
rm -rf /var/lib/apt/lists/*
