#!/bin/bash

set -u

IMAGE=desktop
TAG=i3

docker build . -t $IMAGE --build-arg tag=$TAG --build-arg uid=$UID --build-arg passwd=$(cat .passwd)
