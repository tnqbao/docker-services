#!/bin/bash

IMAGE_NAME="iamqbao/gau_validation_service:latest"
CONTAINER_NAME="gau-validation-service"

# Pull image mới
docker pull $IMAGE_NAME

# Dừng và xóa container nếu nó đang chạy
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# Tạo lại container từ Docker Compose
docker-compose up -d --force-recreate --no-deps $CONTAINER_NAME
