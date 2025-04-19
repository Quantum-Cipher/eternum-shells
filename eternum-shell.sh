#!/bin/bash
# 🌐 Eternum Shell Protocol - Full Init Sequence
# By Drake Manifest Neurospace
# SafeMode and Watchdog Aware

# Load Eternum Banner
if [ -f ~/.eternum_banner.txt ]; then
  clear
  cat ~/.eternum_banner.txt
  echo ""
fi

# Mode Selector
if [[ "$1" == "--safemode" ]]; then
  echo "🔒 Eternum SafeMode Activated"
  export ETERNUM_MODE="SAFE"
else
  export ETERNUM_MODE="FULL"
fi

# SSH Agent Logic
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)"
fi

# Load SSH Key (automatically via Keychain)
if [[ "$ETERNUM_MODE" == "FULL" ]]; then
  ssh-add --apple-use-keychain ~/.ssh/id_ed25519 > /dev/null 2>&1
  echo "🔑 SSH Key loaded via macOS Keychain"
else
  echo "🔐 SafeMode: Manual SSH key entry required"
  ssh-add ~/.ssh/id_ed25519
fi

# Optional Daemon Launch
if [[ "$ETERNUM_MODE" == "FULL" ]]; then
  echo "👁️ Ghostwire Watchdog initializing..."
  # nohup ~/Eternum/Ghostwire/ghostwire_sentinel.sh >> ~/Eternum/Ghostwire/watchdog.log 2>&1 &
fi

echo "✅ Eternum Shell Ready — Mode: $ETERNUM_MODE"
