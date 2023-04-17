#!/bin/bash

# Set log file
LOG_FILE="/var/log/syslog"

# Set search string
SEARCH_STRING="error"

# Monitor log file for search string
tail -f "$LOG_FILE" | grep --line-buffered "$SEARCH_STRING" | while read line; do
