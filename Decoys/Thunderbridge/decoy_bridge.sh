#!/bin/bash
# Decoy Thunderbridge Daemon Script
# Eternum Decoy Environment

echo "⚡ Thunderbridge v1.0 initializing..."
sleep 1
echo "🔗 Opening fake bridge ports..."
sleep 1

# Simulate vulnerable services
nc -l 127.0.0.1 8545 &
nc -l 127.0.0.1 30303 &

echo "✅ Thunderbridge is vulnerable and awaiting connections..."

# Redirect logs to Ghostwire
nc -l 127.0.0.1 9090 | tee ~/Eternum/Ghostwire/ghostwire_decoy.log
