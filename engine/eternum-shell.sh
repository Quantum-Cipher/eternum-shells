#!/bin/bash

# eternal_watchdog.sh
# Launches Whisper, Ghostwire, and Phantom Sentinel as one unified Eternum perimeter.

# === CREATE LOG DIRECTORIES ===
mkdir -p ~/whisper-logs
mkdir -p ~/phantom-logs
mkdir -p ~/audit

# === START WHISPER LOGGER ===
nohup bash -c '
while true; do
  echo "[WHISPER] Passive log heartbeat — $(date)" >> ~/whisper-logs/whisper_current.log
  sleep 120
done
' > ~/whisper-logs/whisper_current.out 2>&1 &

# === START GHOSTWIRE LOGGER ===
nohup bash -c '
while true; do
  echo "[GHOSTWIRE] Scan pulse @ $(date)" >> ~/whisper-logs/ghostwire_trap.log
  lsof -i | grep -i "established" >> ~/whisper-logs/ghostwire_trap.log
  sleep 60
done
' > ~/whisper-logs/ghostwire_trap.out 2>&1 &

# === START PHANTOM DECOY DAEMON ===
nohup bash -c '
while true; do
  echo "$(date), DECOY ACTIVE, dummy_ping_$(openssl rand -hex 2)" >> ~/phantom-logs/decoy_activity.csv
  sleep 90
done
' > ~/phantom-logs/phantom_daemon.out 2>&1 &

# === STATUS MESSAGE ===
echo "🧬 Eternum Watchdog Protocol Initialized @ $(date)"
