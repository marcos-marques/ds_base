#!/bin/bash

BASEDIR="$(pwd)/$(dirname $0)"

cd $BASEDIR

docker-compose build \
    --build-arg "PARAM_UID=$(id -u)" \
    --build-arg "PARAM_GID=$(id -g)";