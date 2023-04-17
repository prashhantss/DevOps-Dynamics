#!/bin/bash

# Set backup directory and file name
BACKUP_DIR="/path/to/backup/directory"
FILE_NAME="backup-$(date +%Y-%m-%d).tar.gz"

# Set directory to be backed up
BACKUP_SRC="/path/to/directory/to/backup"

# Create backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
fi

# Create compressed archive of directory to be backed up
tar -czvf "$BACKUP_DIR/$FILE_NAME" "$BACKUP_SRC"

# Verify backup was created
if [ -f "$BACKUP_DIR/$FILE_NAME" ]; then
  echo "Backup created: $BACKUP_DIR/$FILE_NAME"
else
  echo "Error creating backup"
fi
