#!/bin/bash

IMAGE_NAME="iamqbao/gau_truyen_backend:latest"
CONTAINER_NAME="gau-truyen-backend"
CONTAINER_BACKUP_NAME="gau-truyen-backend-backup"

# Pull image mới
docker pull $IMAGE_NAME

# Dừng và xóa container chính nếu nó đang chạy
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# Tạo lại container chính từ Docker Compose
docker-compose up -d --force-recreate --no-deps $CONTAINER_NAME

# Dừng và xóa container backup nếu nó đang chạy
if [ "$(docker ps -q -f name=$CONTAINER_BACKUP_NAME)" ]; then
    docker stop $CONTAINER_BACKUP_NAME
    docker rm $CONTAINER_BACKUP_NAME
fi

# Tạo lại container backup từ Docker Compose
docker-compose up -d --force-recreate --no-deps $CONTAINER_BACKUP_NAME
