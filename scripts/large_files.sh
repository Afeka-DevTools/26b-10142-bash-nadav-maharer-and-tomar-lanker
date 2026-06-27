#!/bin/bash

if [ -z "$1" ]; then
    read -p "Enter directory to search (Leave blank for current directory): " DIRECTORY
    DIRECTORY=${DIRECTORY:-.}
else
    DIRECTORY="$1"
fi

if [ -z "$2" ]; then
    echo "Enter minimum file size."
    read -p "Options: c (Bytes), k (KB), M (MB), G (GB). Example: 10c or 50M: " SIZE
    SIZE=${SIZE:-100M}
else
    SIZE="$2"
fi

echo "Searching for files larger than $SIZE in $DIRECTORY"
echo "------------------------------------------------------"

RESULTS=$(find "$DIRECTORY" -type f -size +"$SIZE" -exec ls -lh {} \; 2>/dev/null | awk '{ print $5, $9 }')

if [ -z "$RESULTS" ]; then
    echo "No files larger than $SIZE found."
else
    echo "$RESULTS"
fi