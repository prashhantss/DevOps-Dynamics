#!/bin/bash

# Set email address to receive alerts
EMAIL="youremail@example.com"

# Set name of service to monitor
SERVICE_NAME="apache2"

# Check status of service
SERVICE_STATUS=$(systemctl is-active $SERVICE_NAME)

# If service is not running, send alert
if [ "$SERVICE_STATUS" != "active" ]; then
  MESSAGE="Service $SERVICE_NAME is not running"
  echo "$MESSAGE" | mail -s "Service Alert: $SERVICE_NAME" "$EMAIL"
fi
