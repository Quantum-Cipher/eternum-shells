#!/bin/bash
# fibonacci_daemon.sh
# A decoy daemon that appears vulnerable to attract malicious AI/malware,
# using Fibonacci sequence intervals to simulate weakening security cycles.
# All activity is logged into a phantom spiral log for later analysis.

# Ensure the log directory exists
LOG_DIR=~/whisper-logs
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/phantom_spiral.log"

# Initialize the log file with a header
echo "[FIBONACCI DEMON] Initialized at $(date)" >> "$LOG_FILE"

# Initialize Fibonacci sequence variables (in seconds)
a=1
b=1

# Main loop: each cycle represents a "vulnerability window"
while true; do
  # Log that the decoy is "vulnerable"
  echo "[FIBONACCI DEMON] Vulnerable mode active at $(date)" >> "$LOG_FILE"
  
  # Simulate attracting malicious activity with a dummy network scan
  netstat -an | grep -E '443|8545|30303' >> "$LOG_FILE" 2>/dev/null
  
  # Log that a trap has been "triggered"
  echo "[FIBONACCI DEMON] Trap triggered at $(date) – Fibonacci interval: $a seconds" >> "$LOG_FILE"
  
  # Sleep for the current Fibonacci interval
  sleep $a
  
  # Update the Fibonacci sequence
  temp=$b
  b=$((a + b))
  a=$temp
done

