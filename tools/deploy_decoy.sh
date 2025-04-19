#!/bin/bash
echo "[🎭] Deploying Decoy Contract..."

forge script script/deploy_decoy.s.sol \
  --rpc-url https://sepolia.infura.io/v3/YOUR_FAKE_INFURA_KEY \
  --private-key 0x71c9d8d6df2be0a671f7f2e2c36e24d814dc1807e6cc4d96284be34cf6bb0023 \
  --broadcast

