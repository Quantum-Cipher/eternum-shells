#!/bin/bash
# Ghostwire Sentinel logging injected attackers

echo "👻 Ghostwire Sentinel Active - Logging Decoy Traffic..."

while true; do
  nc -l 127.0.0.1 9090 >> ~/Eternum/Ghostwire/ghostwire_captured.log
done

