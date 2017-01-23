#!/bin/bash -f

EXTERNAL_FILE_NAME=$(date +backup-%g%m%d-%H%M.tar)
EXTERNAL_PATH=${FTP_REMOTE_PATH}

echo "------------------------------------------------------------------------"
echo "-- Upload the backup to volume "
echo "------------------------------------------------------------------------"

cd /backup
mv mysql-backup.tar ${EXTERNAL_FILE_NAME}

ftp ${FTP_HOST_ADDR} <<END_FTP_SCRIPT
user ${FTP_USER_NAME}
${FTP_PASSWORD}
cd ${EXTERNAL_PATH}
put ${EXTERNAL_FILE_NAME}
quit
END_FTP_SCRIPT

rm ${EXTERNAL_FILE_NAME}
