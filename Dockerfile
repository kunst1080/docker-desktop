ARG tag
FROM kunst1080/desktop:$tag
MAINTAINER kunst1080 kontrapunkt1080@gmail.com

# user
ARG user=user
ARG passwd=user
ARG uid=1000
RUN groupadd -g 999 docker
RUN useradd ${user} -u $uid -p $passwd -m -G adm,dialout,cdrom,sudo,audio,dip,video,plugdev,netdev,docker -s /bin/bash

USER $user
WORKDIR /home/$user
RUN ln -s /xinitrc .xinitrc
