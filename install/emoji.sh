#!/bin/bash

set -euv

mkdir -p ~/.fonts ~/.config/fontconfig/
cd ~/.fonts

wget https://noto-website-2.storage.googleapis.com/pkgs/NotoColorEmoji-unhinted.zip
unzip NotoColorEmoji-unhinted.zip

cat <<'EOS' > ~/.config/fontconfig/fonts.conf
<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<match>
 <test name="family"><string>sans-serif</string></test>
 <edit name="family" mode="prepend" binding="strong">
 <string>Noto Color Emoji</string>
 </edit>
 </match>
<match>
 <test name="family"><string>serif</string></test>
 <edit name="family" mode="prepend" binding="strong">
 <string>Noto Color Emoji</string>
 </edit>
 </match>
<match>
 <test name="family"><string>Apple Color Emoji</string></test>
 <edit name="family" mode="prepend" binding="strong">
 <string>Noto Color Emoji</string>
 </edit>
 </match>
EOS

fc-cache -f -v
