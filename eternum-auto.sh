#!/bin/bash
# 🌐 Eternum Hybrid Launcher: Shell + Node + Ghostwire Trigger

clear
echo "🌌 Eternum Auto Protocol Ignition"

# Step 1: Load Eternum Shell
bash ~/Eternum/eternum-shell.sh "$@"

# Step 2: Run Ghostwire Node automation (if exists)
if [ -f ~/Eternum/scripts/deployTrap.js ]; then
  echo "👁️ Executing Ghostwire automation via Node.js..."
  node ~/Eternum/scripts/deployTrap.js
else
  echo "⚠️ Node script not found. Skipping automation."
fi

echo "✅ Eternum Auto Protocol Complete — Mode: $ETERNUM_MODE"

