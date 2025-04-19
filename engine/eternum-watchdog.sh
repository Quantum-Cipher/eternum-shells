#!/bin/bash
echo "[Watchdog] Engaged: $(date)" >> ~/Eternum_Watchdog/watchdog.log
lsof -iTCP -sTCP:LISTEN -n -P >> ~/Eternum_Watchdog/watchdog.log
