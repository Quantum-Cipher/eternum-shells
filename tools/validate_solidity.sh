#!/bin/bash

TARGET_FILE=$1
LOG_FILE=~/Eternum/logs/compile_$(date +%Y%m%d_%H%M).log

if [[ -z "$TARGET_FILE" ]]; then
  echo "[❌] Please provide a .sol file to validate."
  exit 1
fi

echo "[🔍] Validating Solidity file: $TARGET_FILE"

# Unicode scan
grep -n '"' "$TARGET_FILE" | grep -E '—|🧬|🔒|🍄|“|”|‘|’' > /tmp/unicode_scan.log

if [[ -s /tmp/unicode_scan.log ]]; then
  echo "[⚠️] Potential Unicode issues found:"
  cat /tmp/unicode_scan.log
  echo "🔧 Recommendation: use unicode\"...\" for any emoji or special punctuation."
else
  echo "[✅] No Unicode string issues detected."
fi

echo "[🛠] Running dry compile..."
forge build --no-cache --contracts "$(dirname "$TARGET_FILE")" --silent &> "$LOG_FILE"

if [[ $? -eq 0 ]]; then
  echo "[✅] Validation Passed: Compile succeeded."
else
  echo "[❌] Validation Failed. Opening log..."
  nano "$LOG_FILE"
fi

rm -f /tmp/unicode_scan.logø

