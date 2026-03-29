#!/bin/bash

# 設定
SOURCE_DIR="$HOME/projects"
BACKUP_DIR="$HOME/backup"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

# 建立備份資料夾（如果不存在）
mkdir -p $BACKUP_DIR

echo "Starting backup..."

# 壓縮備份
tar -czf $BACKUP_FILE $SOURCE_DIR

echo "Backup completed: $BACKUP_FILE"

# 刪除7天前的備份
find $BACKUP_DIR -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;

echo "Old backups cleaned"
