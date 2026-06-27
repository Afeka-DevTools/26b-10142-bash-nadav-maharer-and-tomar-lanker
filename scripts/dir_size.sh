#!/bin/bash

if [ -z "$1" ]; then
    read -p "Enter directory to check (Leave blank for current directory): " DIRECTORY
    DIRECTORY=${DIRECTORY:-.}
else
    DIRECTORY="$1"
fi
du -sh "$DIRECTORY"/* 2>/dev/null

FOLDER_SIZE=$(du -shc "$DIRECTORY"/* 2>/dev/null | tail -n 1 | awk '{print $1}')
DRIVE_SIZE=$(df -h "$DIRECTORY" | awk 'NR==2 {print $2}')
echo "------------------------------------------------"
echo "${FOLDER_SIZE} total out of ${DRIVE_SIZE}"


