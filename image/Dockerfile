ARG tag
FROM kunst1080/x11-wm:$tag
MAINTAINER kunst1080 kontrapunkt1080@gmail.com

# Japanese settings
RUN apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get install -y \
            fcitx-mozc \
            fcitx-tools \
            language-pack-ja \
            fonts-migmix \
            fonts-takao \
            ttf-ancient-fonts-symbola \
            ttf-ancient-fonts \
	&& rm -rf /var/lib/apt/lists/*
ENV XMODIFIERS @im=fcitx
ENV QT_IM_MODULE fcitx
ENV GTK_IM_MODULE fcitx
ENV DefaultIMModule fcitx

RUN locale-gen en_US.UTF-8 ja_JP.UTF-8

# Other tools
RUN apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get install -y \
            pm-utils \
            athena-jot \
            rs \
            d-feet \
            rofi \
            iputils-ping \
            gimp \
            python3-venv \
	&& rm -rf /var/lib/apt/lists/*

# Google Chrome
ADD install-at-build/chrome.sh /tmp/
RUN /tmp/chrome.sh

# Slack
ADD install-at-build/slack.sh /tmp/
RUN /tmp/slack.sh

# Atom
ADD install-at-build/atom.sh /tmp/
RUN /tmp/atom.sh

# VSCode
ADD install-at-build/vscode.sh /tmp/
RUN /tmp/vscode.sh

# emoji
ADD install-at-build/emoji.sh /tmp/
RUN /tmp/emoji.sh

# rescuetime
ADD install-at-build/rescuetime.sh /tmp/
RUN /tmp/rescuetime.sh

RUN apt-get update
