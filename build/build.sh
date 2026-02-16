#!/bin/bash
# ApocalypseOS — Build the ISO
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_DIR"

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: Must run as root (sudo ./build/build.sh)"
    exit 1
fi

if ! command -v lb &>/dev/null; then
    echo "Error: live-build is not installed."
    echo "Run: sudo apt install live-build debootstrap"
    exit 1
fi

echo "=== ApocalypseOS: Building ISO ==="
echo "This will take a while..."

lb build 2>&1 | tee build.log

if [ -f live-image-amd64.hybrid.iso ]; then
    SIZE=$(du -h live-image-amd64.hybrid.iso | cut -f1)
    echo ""
    echo "=== Build complete ==="
    echo "ISO: live-image-amd64.hybrid.iso ($SIZE)"
    echo ""
    echo "Test with: qemu-system-x86_64 -cdrom live-image-amd64.hybrid.iso -m 4G -enable-kvm"
    echo "Write to USB: sudo dd if=live-image-amd64.hybrid.iso of=/dev/sdX bs=4M status=progress"
else
    echo "Error: Build failed. Check build.log for details."
    exit 1
fi
