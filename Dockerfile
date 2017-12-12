FROM kunst1080/x11-wm:i3
MAINTAINER kunst1080 kontrapunkt1080@gmail.com

USER root

RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
            chromium-browser \
            xfce4-terminal \
            language-pack-ja \
            im-config \
            fcitx-mozc \
            fcitx \
            fcitx-tools \
            fcitx-config-gtk \
            fcitx-config-gtk2 \
            fcitx-frontend-all \
            fcitx-frontend-gtk2 \
            fcitx-frontend-gtk3 \
            fcitx-frontend-qt4 \
            fcitx-frontend-qt5 \
            fcitx-ui-classic \
            fcitx-ui-light \
            fcitx-ui-qimpanel \
            mozc-utils-gui \
            fonts-migmix \
            ttf-ancient-fonts-symbola \
            ttf-ancient-fonts

USER $USER
CMD [ "/usr/bin/startx" ]
