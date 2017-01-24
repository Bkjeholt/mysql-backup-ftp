#!/bin/bash -f


echo "------------------------------------------------------------------------"
echo "-- Setup and initiate Volume "
echo "------------------------------------------------------------------------"

ftp -np ${FTP_HOST_ADDR} <<END_FTP_SCRIPT
quote USER $FTP_USER_NAME
quote PASS $FTP_PASSWORD
mkdir $FTP_BACKUP_BASE_DIR
cd $FTP_BACKUP_BASE_DIR
mkdir $DOCKER_CONTAINER_NAME
cd $DOCKER_CONTAINER_NAME
pwd
quit
END_FTP_SCRIPT
