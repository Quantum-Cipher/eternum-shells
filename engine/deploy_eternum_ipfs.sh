#!/bin/bash

# Set working directory
cd ~/vault/genesis_drop || { echo "❌ Directory not found: vault/genesis_drop"; exit 1; }

# Check Eternum_Whitepaper.md exists
if [ ! -f "Eternum_Whitepaper.md" ]; then
  echo "❌ Eternum_Whitepaper.md not found. Aborting."
  exit 1
fi

# Generate SHA-256 hash
echo "🔐 Generating SHA-256 hash..."
sha256sum Eternum_Whitepaper.md > Eternum_Whitepaper.hash
MD_HASH=$(cut -d ' ' -f1 Eternum_Whitepaper.hash)

# Add to IPFS
echo "📡 Uploading Eternum_Whitepaper.md to IPFS..."
CID=$(ipfs add -Q Eternum_Whitepaper.md) || { echo "❌ IPFS upload failed. Is ipfs daemon running?"; exit 1; }

# Save metadata to manifest
echo "📝 Writing eternum_snapshot_manifest.json..."
cat <<EOF > eternum_snapshot_manifest.json
{
  "project": "Eternum",
  "version": "genesis",
  "description": "Immutable whitepaper snapshot with cryptographic proof",
  "file": "Eternum_Whitepaper.md",
  "sha256": "$MD_HASH",
  "ipfs_cid": "ipfs://$CID",
  "timestamp": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "signed": false,
  "author": "Drake Peters",
  "repository": "cipher-space",
  "notes": [
    "This manifest confirms the hash and CID of the initial Eternum whitepaper drop.",
    "Generated locally and stored in offline vault for integrity check."
  ]
}
EOF

# Output results
echo -e "\n✅ DONE!"
echo "📎 SHA-256: $MD_HASH"
echo "📡 IPFS CID: ipfs://$CID"
echo "📄 Manifest saved: eternum_snapshot_manifest.json"
