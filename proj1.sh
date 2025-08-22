#!/bin/bash

FILE="usage.log"

TIME=$(date +"%Y-%m-%d %H:%M:%S")

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')

DISK=$(df -h / | awk 'NR==2 {print $5}')

echo "[$TIME] CPU: $CPU | Disk: $DISK" >> $FILE

git add $FILE

git commit -m "Update usage: $TIME"

git push origin main

