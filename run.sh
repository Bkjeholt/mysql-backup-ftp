#!/bin/sh -f
DOCKER_IMAGE_NAME=bkjeholt/mysql-backup-volume
DOCKER_CONTAINER_NAME=mysql-backup-volume

DOCKER_IMAGE_BASE_TAG=${1}

ARCHITECTURE=rpi

echo "------------------------------------------------------------------------"
echo "-- Run image:       $DOCKER_IMAGE_NAME:latest "

DOCKER_IMAGE=${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_BASE_TAG}-${ARCHITECTURE}

echo "------------------------------------------------------------------------"
echo "-- Remove docker container if it exists"
echo "-- Container:   $DOCKER_CONTAINER_NAME "
echo "------------------------------------------------------------------------"

docker rm -f $DOCKER_CONTAINER_NAME

echo "------------------------------------------------------------------------"
echo "-- Start container "
echo "-- Based on image: $DOCKER_IMAGE "
echo "------------------------------------------------------------------------"

docker run -d \
           --restart=always \
           --name $DOCKER_CONTAINER_NAME \
           --link mysql-db-hic:mysql \
           --vol .:/backup \
           --env FTP_HOST_ADDR="ftp-server.com" \
           --env FTP_USER_NAME="Bamse" \
           --env FTP_PASSWORD="ErFRtg54r-rtTGe4JklP" \
           --env FTP_BACKUP_BASE_DIR="Backup" \
           --env MYSQL_BACKUP_INTERVALL="12" \
           --env DOCKER_CONTAINER_NAME=${DOCKER_CONTAINER_NAME} \
           $DOCKER_IMAGE
