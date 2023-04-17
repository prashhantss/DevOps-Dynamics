#!/bin/bash

# Add user
useradd jdoe

# Set password for user
echo "jdoe:password" | chpasswd

# Delete user
userdel jdoe
