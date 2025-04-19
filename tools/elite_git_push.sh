#!/bin/bash

echo "[⚙️] Creating elite_commit branch if missing..."
git checkout -B elite_commit

echo "[✍️] Adding all changes..."
git add .

echo "[🔐] Committing with GPG signature..."
GIT_COMMITTER_NAME="Quantum-Cipher" \
GIT_COMMITTER_EMAIL="cipherpunk369@proton.me" \
git commit -S -m "🔐 ELITE WORD: Signed bundle + Whisper-logged"

echo "[🚀] Pushing to origin..."
git push origin elite_commit
