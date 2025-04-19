#!/bin/bash

LOG_FILE="$HOME/Eternum/logs/whisper_core.log"
SIG_FILE="$HOME/Eternum/logs/whisper_core.log.sig"

if [[ -f "$LOG_FILE" ]]; then
    gpg --yes --armor --output "$SIG_FILE" --detach-sign "$LOG_FILE"
    echo "[🖋] whisper_core.log signed at $(date)" >> "$HOME/Eternum/logs/whisper_sign_history.log"
else
    echo "[❌] Log file missing at $(date)" >> "$HOME/Eternum/logs/whisper_sign_history.log"
fi
