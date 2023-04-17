#!/bin/bash

# Set backup directory
BACKUP_DIR="/backup"

# Rotate backups
cd "$BACKUP_DIR"
ls -t | tail -n +8 | xargs -d '\n' rm -rf
