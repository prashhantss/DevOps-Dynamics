#!/bin/bash

# Set website URL
URL="https://www.example.com"

# Check website status
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

# Send email alert if website is down
if [ "$STATUS" -ne 200 ]; then
    echo "Website is down" | mail -s "Website down" youremail@example.com
fi
