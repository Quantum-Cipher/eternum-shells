#!/bin/bash
echo "♾️ Eternum Hardhat Shell Engaged: $1"

if [[ "$1" == "compile" ]]; then
    npx hardhat compile --show-stack-traces
elif [[ "$1" == "deploy" ]]; then
    npx hardhat run scripts/deploy.js --network hardhat --show-stack-traces
elif [[ "$1" == "test" ]]; then
    npx hardhat test --show-stack-traces
else
    echo "Unknown command: $1"
    echo "Available commands: compile, deploy, test"
fi
