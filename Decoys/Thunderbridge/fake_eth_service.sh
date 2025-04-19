#!/bin/bash
# Fake Ethereum service for Thunderbridge decoy

echo "[Decoy Ethereum RPC] Running on port 8545"
while true; do
    echo -e "HTTP/1.1 200 OK\nContent-Type: application/json\n\n{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":\"fake_eth_response\"}" | nc -l 8545 >> ~/Eternum/Ghostwire/ghostwire_rpc.log
done
