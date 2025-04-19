#!/bin/bash

FILE=~/Eternum/data_logs/critical_time_cluster.csv
SIG=~/Eternum/data_logs/critical_time_cluster.sig
HASH=~/Eternum/data_logs/critical_time_cluster.sha256
KEYID=A55DAFB3EADF15E0C8DD46B79F42B20896A71B22

echo "[✍️] Signing $FILE with key $KEYID..."
gpg --default-key $KEYID --output $SIG --detach-sign $FILE

echo "[🔐] Generating SHA256 hash..."
shasum -a 256 $FILE > $HASH

echo "[✅] Signature + hash complete."

