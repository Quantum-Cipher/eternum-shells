#!/usr/bin/env zsh

echo "Deploying Watchdog components..."
WATCHDOG_SRC="$HOME/Eternum/Defense/watchdog/src"

if [[ -d "$WATCHDOG_SRC" ]]; then
  cd "$WATCHDOG_SRC"
  echo "🔨 Building Watchdog contract..."
  forge build

  echo "🚀 Deploying Watchdog contract with burner wallet..."
  forge deploy \
    --private-key "$BURNER_PRIVATE_KEY" \
    --rpc-url    "$BURNER_RPC_URL" \
    --verify

  cd -
  echo "✅ Watchdog deployment complete."
else
  echo "⚠️ Watchdog source not found, skipping."
fi
