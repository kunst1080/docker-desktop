#!/bin/bash

X11HOME=$HOME/x11-home
USER=user
LANG=ja_JP.UTF-8
IMAGE=desktop

mkdir -p $X11HOME/{.config,.ssh,.mozc,local,work,Downloads,Pictures}
touch $X11HOME/{.zsh_history,.gitconfig.local,.todoist.config.json}

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
    --shm-size=2gb \
    -e LANG=$LANG \
    -v $PWD/xinitrc.docker:/home/$USER/.xinitrc.docker \
    -v $PWD/install-in-the-container:/home/$USER/local/install \
    $(volumes /run/udev /run/dbus /run/systemd /var/run/docker.sock) \
    $(volumes-ro /etc/localtime /etc/locale.gen /usr/lib/locale/locale-archive) \
    $(volumes-X11 .config .ssh .mozc local work Downloads Pictures .zsh_history .gitconfig.local .todoist.config.json) \
    $IMAGE $* | tee xsession.log
