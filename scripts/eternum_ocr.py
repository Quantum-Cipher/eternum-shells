 import pytesseract
from PIL import Image
import os
from datetime import datetime

INPUT_DIR = "/Users/gest/Eternum/WhisperLogs/screenshots/"
OUTPUT_DIR = "/Users/gest/Eternum/OCRResults/"
TIMESTAMP = datetime.now().strftime("%Y-%m-%d_%H-%M")

os.makedirs(OUTPUT_DIR, exist_ok=True)

def extract_text(image_path):
    image = Image.open(image_path)
    text = pytesseract.image_to_string(image)
    return text

def main():
    for file in os.listdir(INPUT_DIR):
        if file.lower().endswith(('.png', '.jpg', '.jpeg')):
            full_path = os.path.join(INPUT_DIR, file)
            print(f"[+] Extracting text from: {file}")
            extracted = extract_text(full_path)
            out_file = os.path.join(OUTPUT_DIR, f"{file}_{TIMESTAMP}.txt")
            with open(out_file, "w") as f:
                f.write(extracted)
            print(f"[+] Saved to: {out_file}")

if __name__ == "__main__":
    main()
