#!/bin/bash
echo "[🔐] Generating Eternum GPG Key..."
gpg --batch --generate-key ~/Eternum/tools/gen_gpg_key_batch.conf
echo "[✅] Key generation complete. You can now run:"
echo "    gpg --list-secret-keys --keyid-format LONG"
