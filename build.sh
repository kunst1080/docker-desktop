#!/bin/bash

set -u

IMAGE=desktop
docker build . -t $IMAGE --build-arg uid=$UID --build-arg passwd=$(cat .passwd)
