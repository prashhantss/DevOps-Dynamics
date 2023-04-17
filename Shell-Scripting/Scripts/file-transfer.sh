#!/bin/bash

# Set source and destination directories
SOURCE_DIR="/home/user/files"
DESTINATION_DIR="/mnt/backup"

# Transfer files
rsync -avh --progress "$SOURCE_DIR" "$DESTINATION_DIR"
