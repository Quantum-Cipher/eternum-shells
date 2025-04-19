#!/bin/bash

# ⟁ Eternum Bootstrap Script ⟁
# Loads Eternum homepage, terminal banner, and optional local web view

# === Terminal Banner ===
echo "[🌌 Eternum Cipher Loaded: ⟁ϞFIB-13↯7₿µ∞⋆Δ|𝌆⟁]"
cat ~/eternum/Eternum_Cipher_README.md

# === Open HTML Homepage in Browser ===
if [ -f ~/eternum/Eternum_Cipher_README.html ]; then
    open ~/eternum/Eternum_Cipher_README.html
else
    echo "⚠️ HTML file not found: ~/eternum/Eternum_Cipher_README.html"
fi

# === Optional Web Server (localhost:8080) ===
echo "🌐 Starting local Eternum web server at http://localhost:8080 ..."
cd ~/eternum
python3 -m http.server 8080
