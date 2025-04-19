#!/bin/bash
# Ghostwire: Check if WireGuard is active
echo "[Ghostwire] Checking for active WireGuard firewall..."

if ps aux | grep -i '[w]g-quick' || ps aux | grep -i '[w]ireguard'; then
    echo "✅ WireGuard is active."
else
    echo "⚠️ WireGuard is not running. Consider starting local VPN tunnel."
fi
