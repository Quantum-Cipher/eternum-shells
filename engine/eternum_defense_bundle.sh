#!/bin/bash

echo "🔐 Eternum Non-Sudo Defense Bundle Activated"

# Init local log dir
mkdir -p ~/eternum/logs/sim_defense/

# 🕸️ Simulate port watch (no root)
echo "[*] Simulating port 8080 trap..." > ~/eternum/logs/sim_defense/port_watch.log
lsof -i :8080 >> ~/eternum/logs/sim_defense/port_watch.log 2>/dev/null || echo "[No open 8080 connections]" >> ~/eternum/logs/sim_defense/port_watch.log

# 🧬 Whisper & Watchdog scan
echo "[*] Scanning for analytics and rogue daemons..." > ~/eternum/logs/sim_defense/daemon_check.log
launchctl list | grep -iE "analytics|watchdog|proxy|vpn" >> ~/eternum/logs/sim_defense/daemon_check.log

# 🌐 Bridgehunter (VPN Layer Sim)
echo "[*] Checking network routes and DNS leak points..." > ~/eternum/logs/sim_defense/network_trace.log
netstat -nr >> ~/eternum/logs/sim_defense/network_trace.log
scutil --dns >> ~/eternum/logs/sim_defense/network_trace.log

# 📜 CID lock display
CID="ipfs://QmZgz526NknroaJRzyBKBqKF3RraAPUAVLE8sLhPdehG6b"
echo "[CID LOCK] Active CID: $CID" >> ~/eternum/logs/sim_defense/defense_bundle.log

echo "✅ Bundle complete. Logs in ~/eternum/logs/sim_defense/"
