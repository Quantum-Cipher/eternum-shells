#!/bin/zsh

echo "🎭 Deploying DECOY SAVEDAN..."
forge script script/deploy_savendan_decoy.s.sol \
  --rpc-url https://goerli.infura.io/v3/YOUR_INFURA_KEY \
  --private-key $(cat ~/Eternum/burner/private.key) \
  --broadcast

echo "🧱 Deploying REAL SAVEDAN..."
forge script script/deploy_savendan.s.sol \
  --rpc-url https://goerli.infura.io/v3/YOUR_INFURA_KEY \
  --private-key YOUR_REAL_PRIVATE_KEY \
  --broadcast
