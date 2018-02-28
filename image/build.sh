#!/bin/bash

set -u

DOCKER_TAG=$1
IMAGE_NAME=kunst1080/desktop:$DOCKER_TAG

docker build --build-arg tag=$DOCKER_TAG -t $IMAGE_NAME .

