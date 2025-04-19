#!/bin/bash
ETERNUM_LOG="$HOME/whisper-logs/login_checker.log"
ECHO_ALERT="⚠️ ALERT: Potential breach detected — Verify shell integrity!"

echo "🔐 Running Eternum Shell Integrity Check..." >> "$ETERNUM_LOG"

if ! grep -q 'Eternum Quantum Shell Activated' ~/.bash_profile; then
  echo "$ECHO_ALERT" >> "$ETERNUM_LOG"
fi

echo "✅ Check complete @ $(date)" >> "$ETERNUM_LOG"

bash ~/eternum-check.sh &
