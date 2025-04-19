#!/bin/bash

BUNDLE=~/Eternum/data_logs/critical_time_cluster.csv
echo "[📡] Adding $BUNDLE to IPFS..."
ipfs add $BUNDLE
