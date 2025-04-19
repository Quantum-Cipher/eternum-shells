#!/bin/zsh
echo "🌐 Disabling all outgoing network..."
networksetup -setnetworkserviceenabled Wi-Fi off

echo "📦 Setting up offline toolkit environment..."
cd ~/Eternum
mkdir -p offline_toolkit/logs offline_toolkit/scripts

cp eternum-truth-vault/pdf_extract.py offline_toolkit/scripts/
cp eternum-truth-vault/dan_safe_remote_mirror.sh offline_toolkit/scripts/
cp eternum-truth-vault/signature_map.txt offline_toolkit/
cp eternum-truth-vault/ALS_investigation_log.txt offline_toolkit/
cp -r ghostnode offline_toolkit/
cp -r whisper-logs offline_toolkit/

echo "📜 Installing local virtualenv and pdf tools..."
python3.13 -m venv offline_toolkit/env
source offline_toolkit/env/bin/activate
pip install --no-index --find-links=pdfenv/lib python-pdfminer

echo "🔒 Hardening terminal against eval/curl/injection..."
touch ~/.zshrc.local && echo "# No network commands allowed" >> ~/.zshrc.local
echo "alias curl='echo BLOCKED'" >> ~/.zshrc.local
echo "alias wget='echo BLOCKED'" >> ~/.zshrc.local
echo "alias eval='echo BLOCKED'" >> ~/.zshrc.local
echo "source ~/.zshrc.local" >> ~/.zshrc

echo "✅ Offline toolkit is locked, loaded, and ready."

