#!/bin/bash -f

FILE_NAME=$(date +backup-%g%m%d-%H%M.tar)
DEFAULT_REMOTE_PATH=/backup

# FILE_NAME=${$FTP_BACKUP_FILENAME:-$DEFAULT_FILE_NAME}

# EXTERNAL_PATH=${$FTP_REMOTE_PATH:-$DEFAULT_REMOTE_PATH}

echo "------------------------------------------------------------------------"
echo "-- Upload the backup to volume "
echo "------------------------------------------------------------------------"

cd /backup
mv mysql-backup.tar ${FILE_NAME}

ftp ${FTP_HOST_ADDR} <<END_FTP_SCRIPT
user ${FTP_USER_NAME}
${FTP_PASSWORD}
cd ${EXTERNAL_PATH}
put ${FILE_NAME}
quit
END_FTP_SCRIPT

rm ${FILE_NAME}
