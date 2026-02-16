#!/bin/bash
# ApocalypseOS — Clean build artifacts
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_DIR"

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: Must run as root (sudo ./build/clean.sh)"
    exit 1
fi

echo "=== ApocalypseOS: Cleaning build artifacts ==="

lb clean --purge 2>/dev/null || true
rm -f build.log
rm -f live-image-amd64.hybrid.iso

echo "=== Clean complete ==="
