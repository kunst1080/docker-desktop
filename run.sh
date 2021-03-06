#!/bin/bash

X11HOME=$HOME/x11-home
X11HOME_CACHE=$HOME/x11-home-cache
USER=user
LANG=ja_JP.UTF-8
IMAGE=desktop

mkdir -p $X11HOME/{.config,.ssh,.persist,bin,work,Downloads,Pictures}
mkdir -p $X11HOME_CACHE

volumes() {
    for i in $*; do
        echo -v $i:$i
    done
}
volumes-ro() {
    for i in $*; do
        echo -v $i:$i:ro
    done
}
volumes-X11() {
    for i in $*; do
        echo -v $X11HOME/$i:/home/$USER/$i
    done
}

exec docker run --rm --privileged \
    --shm-size=8gb \
    -e LANG=$LANG \
    -v $PWD/xinitrc.docker:/home/$USER/.xinitrc.docker \
    -v $PWD/install-in-the-container:/home/$USER/.install \
    -v $X11HOME_CACHE:/home/$USER/.tmp \
    $(volumes /run/udev /run/dbus /run/systemd /var/run/docker.sock) \
    $(volumes-ro /etc/localtime) \
    $(volumes-X11 .config .ssh .persist bin work Downloads Pictures) \
    $DOCKER_DESKTOP_OPTS \
    $IMAGE $* | tee xsession.log
