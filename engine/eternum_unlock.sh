#!/bin/sh
echo "[ΞTERNUM :: DECRYPTOR 🔐]"

read -p "Enter encrypted filename: " file
read -sp "Enter GPG passphrase: " passphrase
echo ""

output="/tmp/decrypted_$(basename "$file" .asc)_$(date +%s).zip"

gpg --pinentry-mode loopback --passphrase "$passphrase" \
    --output "$output" \
    --decrypt "$file" && \
echo "✅ Decrypted to: $output" || \
echo "❌ Decryption failed."

exit 0
