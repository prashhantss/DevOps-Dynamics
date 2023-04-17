#!/bin/bash

# Set remote server information
SSH_USER="username"
SSH_HOST="remote.example.com"
SSH_PORT="22"
SSH_KEYFILE="/path/to/private/key"

# Set command to run on remote server
REMOTE_COMMAND="ls /home"

# Connect to remote server and run command
ssh -i "$SSH_KEYFILE" -p "$SSH_PORT" "$SSH_USER@$SSH_HOST" "$REMOTE_COMMAND"
