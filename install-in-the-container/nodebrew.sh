#!/bin/sh

set -euv

if [ "$NODEBREW_ROOT" = "" ] ; then
  exit
fi

brew install nodebrew

mkdir -p $NODEBREW_ROOT
cd $NODEBREW_ROOT
nodebrew setup_dirs
nodebrew install-binary v6.10.3
nodebrew use v6.10.3
