#!/bin/bash

# Set email information
EMAIL="youremail@example.com"
SUBJECT="Test email"
BODY="This is a test email sent from a shell script"

# Send email
echo "$BODY" | mail -s "$SUBJECT" "$EMAIL"
