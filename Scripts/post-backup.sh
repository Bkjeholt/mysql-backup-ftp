#!/bin/bash -f

FILE_NAME=$(date +backup-%g%m%d-%H%M.tar)
DEFAULT_REMOTE_PATH=backup

# FILE_NAME=${$FTP_BACKUP_FILENAME:-$DEFAULT_FILE_NAME}

# EXTERNAL_PATH=${$FTP_REMOTE_PATH:-$DEFAULT_REMOTE_PATH}

echo "------------------------------------------------------------------------"
echo "-- Upload the backup to volume "
echo "--  ftp addr ${FTP_HOST_ADDR} "
echo "------------------------------------------------------------------------"

cd /backup
mv mysql-backup.tar ${FILE_NAME}

ls -al

ftp -np ${FTP_HOST_ADDR} <<END_FTP_SCRIPT
quote USER $FTP_USER_NAME
quote PASS $FTP_PASSWORD
cd $DEFAULT_REMOTE_PATH
put $FILE_NAME
quit
END_FTP_SCRIPT

rm ${FILE_NAME}
