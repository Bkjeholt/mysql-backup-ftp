#!/bin/bash -f

EXTERNAL_FILE_NAME=$(date +backup-%g%m%d-%H%M.tar)

echo "------------------------------------------------------------------------"
echo "-- Upload the backup to volume "
echo "------------------------------------------------------------------------"

cd /backup
mv mysql-backup.tar ${EXTERNAL_FILE_NAME}

ftp ${FTP_HOST_ADDR} <<END_FTP_SCRIPT
user ${FTP_USER_NAME}
${FTP_PASSWORD}
put ${EXTERNAL_FILE_NAME}
quit
END_FTP_SCRIPT

rm ${EXTERNAL_FILE_NAME}
