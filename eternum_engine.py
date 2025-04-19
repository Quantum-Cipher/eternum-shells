import os
import datetime
import logging
import hashlib
import socket
import psutil
from pathlib import Path

# Initialize Eternum Audit Logger
log_dir = Path.home() / "Eternum/engine_logs"
log_dir.mkdir(parents=True, exist_ok=True)
log_file = log_dir / f"eternum_audit_{datetime.date.today()}.log"

logging.basicConfig(
    filename=str(log_file),
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
)

def log_event(message):
    logging.info(message)
    print(f"[LOGGED] {message}")

def hash_file(file_path):
    try:
        with open(file_path, "rb") as f:
            return hashlib.sha256(f.read()).hexdigest()
    except FileNotFoundError:
        return None

def scan_ports():
    trap_ports = [8080, 1337, 4433]
    for port in trap_ports:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(1)
        result = sock.connect_ex(("localhost", port))
        if result == 0:
            log_event(f"Trap port {port} is OPEN")
        else:
            log_event(f"Trap port {port} is CLOSED")
        sock.close()

def monitor_cpu_ram():
    cpu = psutil.cpu_percent(interval=1)
    ram = psutil.virtual_memory().percent
    log_event(f"System CPU: {cpu}% | RAM: {ram}%")

def hash_audit_dir(target_dir):
    log_event(f"Hashing files in {target_dir}")
    for file in Path(target_dir).rglob("*"):
        if file.is_file():
            hash_val = hash_file(file)
            log_event(f"File: {file.name} | SHA256: {hash_val}")

# RUN ETERNUM ENGINE
log_event("Eternum Engine Booting with Audit Protocols")
monitor_cpu_ram()
scan_ports()
hash_audit_dir(str(Path.home() / "Eternum/data_logs"))

log_event("Eternum Engine Sequence Complete")
