#!/bin/bash

# Log system events to file
tail -f /var/log/syslog > /var/log/system.log &
