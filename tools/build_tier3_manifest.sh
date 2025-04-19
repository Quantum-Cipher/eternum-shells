#!/bin/bash
echo "[🧾] Building Tier-3 Manifest..."

COMMIT=$(git -C ~/Eternum rev-parse HEAD)
CSV_HASH=$(shasum -a 256 ~/Eternum/data_logs/critical_time_cluster.csv | awk '{print $1}')
VAULT=$(ls -t ~/Eternum/vaults/ | head -n1)

cat <<EOF > ~/Eternum/data_logs/tier3_manifest.json
{
  "commit_hash": "$COMMIT",
  "sha256_csv": "$CSV_HASH",
  "latest_vault_file": "$VAULT",
  "generated": "$(date)"
}
EOF

echo "[✅] Manifest created: tier3_manifest.json"
