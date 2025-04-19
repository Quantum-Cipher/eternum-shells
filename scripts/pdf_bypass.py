import PyPDF2
import os

pdf_path = "/Users/gest/Documents/Untitled.pdf"
passwords = ["drake", "dan", "1234", "eternum", "proxy", "generalatomics", "amy", "peters", "DAN2024", "trust", "ALS", "UCSD", "0000", "trial", "stemcell"]

def try_passwords(path, passlist):
    with open(path, "rb") as f:
        reader = PyPDF2.PdfReader(f)
        for pwd in passlist:
            try:
                if reader.decrypt(pwd):
                    print(f"✅ SUCCESS: Password is '{pwd}'")
                    return pwd
            except Exception as e:
                print(f"❌ Failed with '{pwd}' — {e}")
    print("🚫 No password worked.")
    return None

try_passwords(pdf_path, passwords)
