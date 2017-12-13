FROM kunst1080/x11-wm:i3-fcitx
MAINTAINER kunst1080 kontrapunkt1080@gmail.com

USER root

RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
            language-pack-ja \
            fonts-migmix \
            fonts-takao \
            ttf-ancient-fonts-symbola \
            ttf-ancient-fonts \
            chromium-browser \
            chromium-browser-l10n \
            xfce4-terminal

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
            gawk \
            nkf \
            athena-jot \
            rs \
            mecab \
            jq \
            moreutils \
            num-utils

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
            patchutils \
            colordiff

USER $USER
CMD [ "/usr/bin/startx" ]
