#!/bin/bash
# Eternum Watchdog Protocol — Shadow Sovereign Deploy
# Activated by Commander 369-A

LOG_DIR=~/whisper-logs
LOG_FILE="$LOG_DIR/robust_watchdog.log"
mkdir -p $LOG_DIR

echo "[WATCHDOG INITIATED] Robust Watchdog Engine started at $(date)" >> $LOG_FILE

while true; do
  echo "----- $(date) -----" >> $LOG_FILE
  netstat -antup | grep -E '443|8545|30303' >> $LOG_FILE
  ps aux | grep -i 'phantom\|remote\|observer\|vpn\|firefox' >> $LOG_FILE
  lsof -i -nP | grep -Ei 'firefox|metamask|bridge|wallet' >> $LOG_FILE
  echo "Trap Signatures Monitored:" >> $LOG_FILE
  cat ~/ghostwire/trapsignatures/*.json >> $LOG_FILE
  echo "" >> $LOG_FILE
  sleep 60
done
