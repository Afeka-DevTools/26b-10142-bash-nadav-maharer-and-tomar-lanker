#!/bin/bash

while true; do
    ping -c 1 -W 1 8.8.8.8 &>/dev/null && G="OK" || G="DOWN"
    ping -c 1 -W 1 1.0.0.1 &>/dev/null && C="OK" || C="DOWN"
    ping -c 1 -W 1 82.102.147.34 &>/dev/null && A="OK" || A="DOWN"
    # you can add more
    echo "[$(date +%T)] Google: $G | Cloudflare: $C | Israel(Partner): $A"
    sleep 5
done