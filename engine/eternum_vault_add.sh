#!/bin/zsh

VAULT_BASE=~/Desktop/phantom_vault
ARCHIVE_NAME=eternum_bundle_$(date +%Y%m%d_%H%M%S).zip
ENCRYPTED_NAME="$ARCHIVE_NAME.gpg"

echo "[ΞTERNUM] Initializing classified vault..."
mkdir -p "$VAULT_BASE"/{github_activity,defense_protocols,ghostwire_collab,als_investigation,wallet_signatures,source_code,audit_logs}

echo "[ΞTERNUM] Scanning system for sensitive Eternum-related assets..."

find ~ -type f \( \
  -iname "*eternum*" -o -iname "*ghostwire*" -o -iname "*wallet*" -o \
  -iname "*signature*" -o -iname "*audit*" -o -iname "*als*" -o \
  -iname "*.sol" -o -iname "*.sh" -o -iname "*.md" -o -iname "*.json" -o \
  -iname "*.gpg" -o -iname "*.asc" \) 2>/dev/null | while read -r f; do

  fname=$(basename "$f")

  case "$f" in
    *".git"*|*"github"*) cp -v "$f" "$VAULT_BASE/github_activity/" ;;
    *"vpn"*|*"wireguard"*|*"watchdog"*|*"protocol"*) cp -v "$f" "$VAULT_BASE/defense_protocols/" ;;
    *"ghostwire"*) cp -v "$f" "$VAULT_BASE/ghostwire_collab/" ;;
    *"als"*|*"dan"*) cp -v "$f" "$VAULT_BASE/als_investigation/" ;;
    *"wallet"*|*"signature"*|*"keystore"*) cp -v "$f" "$VAULT_BASE/wallet_signatures/" ;;
    *"eternum"*|*.sol|*.sh|*.md|*.json) cp -v "$f" "$VAULT_BASE/source_code/" ;;
    *"audit"*|*"log"*|*"manifest"*) cp -v "$f" "$VAULT_BASE/audit_logs/" ;;
  esac
done

cd ~/Desktop

echo "[ΞTERNUM] Zipping vault..."
zip -r "$ARCHIVE_NAME" phantom_vault > /dev/null

echo "[ΞTERNUM] Encrypting vault with AES256..."
gpg --symmetric --cipher-algo AES256 --pinentry-mode loopback --output "$ENCRYPTED_NAME" "$ARCHIVE_NAME"

echo "[ΞTERNUM] Cleaning up unencrypted files..."
rm -rf "$VAULT_BASE" "$ARCHIVE_NAME"

echo "✅ Vault complete: $ENCRYPTED_NAME"
