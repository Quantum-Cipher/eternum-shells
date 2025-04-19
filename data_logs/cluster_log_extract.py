# const mnemonic = "your twelve words here";
# const node = HDNode.fromMnemonic(mnemonic);
# const wallet = new Wallet(node.derivePath("m/44'/60'/0'/0/0"));
# console.log(wallet.address);

from datetime import datetime, timedelta
import pandas as pd

# Replace with actual logs if available — these are placeholders.
log_data = [
    # {"event": "Amy denies ROI access", "timestamp": "2025-03-02 08:10:00"},
    {"event": "Altered state begins", "timestamp": "2025-03-01 14:23:00"},
    {"event": "Subject Delta hospitalized", "timestamp": "2025-03-02 13:45:00"},
    {"event": "Trial enrollment noted", "timestamp": "2025-03-04 09:30:00"},
    {"event": "Trust document updated", "timestamp": "2025-03-03 17:15:00"},
    {"event": "Metadata ping from smart device", "timestamp": "2025-03-02 23:00:00"},
    {"event": "Bank POA log triggered", "timestamp": "2025-03-03 10:42:00"},
]

# Convert and calculate
df = pd.DataFrame(log_data)
df['timestamp'] = pd.to_datetime(df['timestamp'])

# Find hospitalization event
hospitalization_time = df[df['event'] == "Subject Delta hospitalized"]['timestamp'].iloc[0]
time_window_start = hospitalization_time - timedelta(days=1)
time_window_end = hospitalization_time + timedelta(days=3)

# Filter for the critical time cluster
critical_logs = df[(df['timestamp'] >= time_window_start) & (df['timestamp'] <= time_window_end)]

# Export to clean bundle CSV
output_path = "/Users/gest/Eternum/data_logs/critical_time_cluster.csv"
critical_logs.to_csv(output_path, index=False)
print(f"✅ Critical logs saved to {output_path}")
