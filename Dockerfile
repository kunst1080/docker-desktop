FROM kunst1080/x11-wm:i3
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

# Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
        && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
        && apt-get update \
        && apt-get install -y google-chrome-stable \
	&& rm -rf /var/lib/apt/lists/*

# Other tools
RUN apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get install -y \
            pm-utils \
            nkf \
            athena-jot \
            rs \
            mecab \
            jq \
            moreutils \
            num-utils \
            patchutils \
            colordiff \
	&& rm -rf /var/lib/apt/lists/*

# user
ENV USER user
RUN useradd ${USER} -m -G adm,dialout,cdrom,sudo,audio,dip,video,plugdev,netdev -s /bin/bash && echo $USER:$USER | chpasswd

USER $USER
WORKDIR /home/$USER
RUN ln -s /xinitrc .xinitrc

CMD [ "/usr/bin/startx" ]
