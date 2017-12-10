FROM kunst1080/x11:i3
MAINTAINER kunst1080 kontrapunkt1080@gmail.com

USER root

RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
            xfce4-terminal \
            less \
            chromium-browser \
            ibus-mozc \
            fonts-takao 

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
            apt-file

USER $USER
CMD [ "/usr/bin/startx" ]
