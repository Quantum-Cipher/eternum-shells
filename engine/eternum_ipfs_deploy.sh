#!/bin/zsh

# ♾️ Eternum Shell: IPFS Deployment Automation (Ceremony-Ready Edition)

# === Configuration ===
VAULT_NAME="Genesis_Vault.369235567"
VAULT_PATH="/Volumes/$VAULT_NAME"
MIGRATION_URL="https://dist.ipfs.tech/fs-repo-migrations/v2.0.0/fs-repo-migrations_v2.0.0_darwin-arm64.tar.gz"
MIGRATION_PACKAGE="fs-repo-migrations_v2.0.0_darwin-arm64.tar.gz"

# === Step 1: Mount Path Validation ===
if [ ! -d "$VAULT_PATH" ]; then
  echo "❌ ERROR: Vault not found at $VAULT_PATH"
  echo "🔍 Searching mounted volumes..."
  ALT_PATH=$(ls /Volumes | grep Genesis | head -n1)
  if [ -n "$ALT_PATH" ]; then
    VAULT_PATH="/Volumes/$ALT_PATH"
    echo "✅ Auto-corrected path: $VAULT_PATH"
  else
    echo "🚨 Genesis Vault not mounted. Please plug in the disk and try again."
    exit 1
  fi
fi

# === Step 2: Ensure IPFS is Initialized ===
if [ ! -d "$HOME/.ipfs" ]; then
  echo "🌱 Initializing IPFS for first-time use..."
  ipfs init
fi

# === Step 3: Try Starting IPFS Daemon ===
echo "🚀 Launching IPFS daemon (may fail if migration is needed)..."
ipfs daemon &
sleep 5

# === Step 4: Try IPFS Add to Check for Migration Requirement ===
echo "🔍 Checking IPFS compatibility with current repo..."
CHECK=$(ipfs add "$VAULT_PATH" 2>&1)

if [[ "$CHECK" == *"needs migration"* ]]; then
  echo "⚠️ IPFS repo requires migration. Starting automated repair..."

  # === Step 5: Download & Run Migration Tool ===
  cd ~ || exit 1
  if [ ! -f "$MIGRATION_PACKAGE" ]; then
    echo "⬇️  Downloading migration tool..."
    curl -O "$MIGRATION_URL" || {
      echo "❌ Download failed. Please check your network or security filters."
      exit 1
    }
  fi

  tar -xvzf "$MIGRATION_PACKAGE"
  cd fs-repo-migrations* || exit 1
  chmod +x fs-repo-migrations
  ./fs-repo-migrations -y || {
    echo "❌ Migration failed."
    exit 1
  }

  echo "✅ Migration successful. Relaunching daemon..."
  ipfs daemon &
  sleep 5
fi

# === Step 6: Add Vault to IPFS ===
echo "📡 Adding vault to IPFS: $VAULT_PATH"
CID=$(ipfs add -r "$VAULT_PATH" | tail -n 1 | awk '{print $2}')

# === Step 7: Save and Log CID ===
if [ -n "$CID" ]; then
  echo "🔐 Vault CID: $CID"
  echo "CID: $CID" > ~/Desktop/Eternum_CID_$(date +%Y%m%d_%H%M%S).txt
  echo "✅ IPFS Deployment Complete. CID logged to Desktop."
else
  echo "❌ ERROR: No CID returned. Deployment may have failed."
fi
