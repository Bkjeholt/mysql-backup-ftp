#!/bin/bash -f

echo "------------------------------------------------------------------------"
echo "-- Upload the backup to dropbox "
echo "------------------------------------------------------------------------"

mv /backup/mysql-backup.tar $(date +Backup--%F_%H%M.tar)
