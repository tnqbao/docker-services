#!/bin/bash

IMAGE_NAME="iamqbao/gau_truyen_frontend:latest"
CONTAINER_NAME="gau-truyen-frontend"

docker pull $IMAGE_NAME

if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi


docker compose up -d --force-recreate --no-deps $CONTAINER_NAME

