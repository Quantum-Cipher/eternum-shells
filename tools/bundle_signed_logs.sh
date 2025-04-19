#!/bin/bash

cd ~/Eternum/data_logs

# Bundle files
tar -czf ~/Eternum/bundles/signed_cluster_bundle.tar.gz \
    critical_time_cluster.csv \
    critical_time_cluster.sig \
    critical_time_cluster.sha256

echo "[🔥] Signed logs bundled and burnproof ready."

# Git commit and push
cd ~/Eternum
git add .
git commit -m "📦 Add signed cluster bundle and related logs [autocommit]"
git push

echo "[🚀] Git push complete."
