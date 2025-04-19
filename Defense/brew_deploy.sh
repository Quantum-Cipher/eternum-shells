#!/bin/bash
# Eternum Homebrew Tool Deployment
echo "=== ⚙️ Eternum Tool Setup: OCR + Metadata Support ==="

# Check if brew is installed
if ! command -v brew &> /dev/null; then
  echo "❌ Homebrew is not installed."
  echo "Attempting user-level fallback..."

  # Check for limited alternatives
  echo "⚠️ You do not have sudo access. Consider:
  1. Requesting admin access temporarily
  2. Using a secondary admin account (if available)
  3. Running Eternum OCR on another device

  If you're unable to install brew, I’ll prep an offline toolkit."

  exit 1
fi

# Install tools
echo "Installing tesseract, poppler, exiftool..."
brew install tesseract poppler exiftool

echo "✅ OCR + Metadata tools installed."
