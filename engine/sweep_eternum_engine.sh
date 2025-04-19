#!/bin/bash
echo "[⚙️] Sweeping Eternum Scripts into Unified Engine..."
mkdir -p ~/eternum/engine/logs/sweep
log_file=~/eternum/engine/logs/sweep/$(date +%Y%m%d_%H%M%S)_sweep.log

find ~ -type f \( -name "*eternum*.py" -o -name "*eternum*.sh" -o -name "*eternum*.command" -o -name "*eternum*.sol" -o -name "*eternum*.md" \) ! -path "~/eternum/engine/*" | while read -r file; do
  filename=$(basename "$file")
  dest="~/eternum/engine/$filename"
  if [ ! -f "$dest" ]; then
    cp "$file" ~/eternum/engine/
    echo "Moved: $file" >> "$log_file"
  else
    echo "Skipped duplicate: $file" >> "$log_file"
  fi
done

echo "[✅] Sweep complete. Log saved to $log_file"
