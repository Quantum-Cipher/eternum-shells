#!/usr/bin/env zsh

echo "Deploying Blackhole Decoy..."
BLACKHOLE_SRC="$HOME/Eternum/Defense/blackhole_decoy/src"

if [[ -d "$BLACKHOLE_SRC" ]]; then
  cd "$BLACKHOLE_SRC"
  echo "🔨 Building Blackhole Decoy contract..."
  forge build

  echo "🚀 Deploying Blackhole Decoy contract with burner wallet..."
  forge deploy \
    --private-key "$BURNER_PRIVATE_KEY" \
    --rpc-url    "$BURNER_RPC_URL" \
    --verify

  cd -
  echo "✅ Blackhole Decoy deployment complete."
else
  echo "⚠️ Blackhole Decoy directory not found, skipping."
fi
