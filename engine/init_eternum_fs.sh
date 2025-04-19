#!/bin/bash

echo "🌐 [Eternum] Initializing directory scaffolding..."

REQUIRED_DIRS=(
    "scripts"
    "deploy"
    "vault/cli_tools"
    "vault/ai_agents"
    "vault/databases"
    "vault/daemons"
    "vault/creatives"
    "vault/watchdogs"
    "vault/analyzers"
    "vault/backups"
    "logs"
    "src"
    "script"
)

for dir in "${REQUIRED_DIRS[@]}"; do
    if [ ! -d "$dir" ]; then
        echo "📁 Creating missing directory: $dir"
        mkdir -p "$dir"
    fi
done

echo "✅ [Eternum] Directory check complete."i
