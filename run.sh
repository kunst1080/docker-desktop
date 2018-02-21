#!/bin/bash

X11HOME=$HOME/x11-home
USER=user
LANG=ja_JP.UTF-8
IMAGE=desktop

mkdir -p $X11HOME/{.config,.ssh,.persist,local,work,Downloads,Pictures}

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
    -v $PWD/install-in-the-container:/home/$USER/local/install \
    $(volumes /run/udev /run/dbus /run/systemd /var/run/docker.sock) \
    $(volumes-ro /etc/localtime) \
    $(volumes-X11 .config .ssh .persist local work Downloads Pictures) \
    $IMAGE $* | tee xsession.log
