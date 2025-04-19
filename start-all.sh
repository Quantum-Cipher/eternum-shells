#!/bin/bash
# start-all.sh - Launch Eternum services: IPFS, Whisper Daemon, and Ghostwire Sentinel

echo "===================================="
echo "Starting Eternum Services..."
echo "===================================="

# Start IPFS daemon if available
if command -v ipfs >/dev/null 2>&1; then
    echo "🔗 Starting IPFS daemon..."
    ipfs daemon > ~/Eternum/logs/ipfs.log 2>&1 &
    echo "IPFS daemon started."
else
    echo "❌ IPFS not installed, skipping IPFS daemon."
fi

# Start Whisper Daemon
echo "📡 Starting Whisper Daemon..."
nohup bash ~/Eternum/whisper-daemon.sh > ~/Eternum/logs/whisper.log 2>&1 &
echo "Whisper Daemon started."

# Start Ghostwire Sentinel
echo "👁️ Starting Ghostwire Sentinel..."
nohup bash ~/Eternum/ghostwire-sentinel.sh > ~/Eternum/logs/ghostwire.log 2>&1 &
echo "Ghostwire Sentinel started."

echo "===================================="
echo "All Eternum services are up and running."
echo "To view the live Whisper log, run:"
echo "  tail -f ~/whisper-logs/whisper_current.log"
echo "===================================="
