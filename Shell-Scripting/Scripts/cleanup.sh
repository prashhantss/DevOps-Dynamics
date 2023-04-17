#!/bin/bash

# Set directories to be cleaned up
TEMP_DIRS=("/tmp" "/var/tmp")

# Set minimum age for files to be deleted (in days)
MIN_AGE=7

# Clean up temporary directories
for dir in "${TEMP_DIRS[@]}"; do
  echo "Cleaning up $dir..."
  find "$dir" -type f -mtime +$MIN_AGE -delete
done

# Clean up log files
echo "Cleaning up log files..."
find /var/log -type f -name "*.log" -mtime +$MIN_AGE -delete

echo "Cleanup complete"
