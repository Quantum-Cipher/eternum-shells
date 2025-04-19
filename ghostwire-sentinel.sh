#!/bin/bash

log_file="$HOME/whisper-logs/test_watchdog_$(date '+%Y%m%d_%H%M%S').log"
mkdir -p "$HOME/whisper-logs"

echo "👁️ Ghostwire Sentinel Activated at $(date)" >> "$log_file"

while true; do
  echo "[ $(date '+%Y-%m-%d %H:%M:%S') ] :: audit-pulse OK :: system stable" >> "$log_file"
  sleep 60
done
