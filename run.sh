#!/bin/bash

X11HOME=$HOME/x11-home
USER=user
LANG=ja_JP.UTF-8

mkdir -p $X11HOME/{local,.config,work,Downloads,Pictures}

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
volumes-home() {
    for i in $*; do
        echo -v $HOME/$i:/home/$USER/$i
    done
}

exec docker run  -it --rm --privileged \
    -e LANG=$LANG \
    -e NO_AT_BRIDGE=1 \
    -v $PWD/xinitrc.docker:/home/$USER/.xinitrc.docker \
    -v $PWD/install:/home/$USER/local/install \
    $(volumes /run/udev /run/dbus/system_bus_socket) \
    $(volumes-ro /etc/localtime /etc/locale.gen /usr/lib/locale/locale-archive) \
    $(volumes-X11 .config local work Downloads Pictures) \
    $(volumes-home .ssh .gitconfig.local) \
    desktop $* | tee xsession.log
