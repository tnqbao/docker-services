#!/bin/bash

IMAGE_NAME="iamqbao/gau_user_service:latest"
CONTAINER_NAME="gau-user-service"

if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

docker pull $IMAGE_NAME

docker compose up -d --force-recreate --no-deps $CONTAINER_NAME

