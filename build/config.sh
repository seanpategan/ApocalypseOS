#!/bin/bash
# ApocalypseOS — live-build configuration
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "=== ApocalypseOS: Configuring live-build ==="

cd "$PROJECT_DIR"

lb config \
    --distribution bookworm \
    --archive-areas "main contrib non-free non-free-firmware" \
    --bootappend-live "boot=live components" \
    --debian-installer live \
    --iso-application "ApocalypseOS" \
    --iso-publisher "ApocalypseOS Project" \
    --iso-volume "ApocalypseOS" \
    --memtest none \
    --win32-loader false

# Copy our package lists into the live-build config
cp -r "$PROJECT_DIR/config/package-lists/"* config/package-lists/ 2>/dev/null || true

# Copy filesystem overlay
if [ -d "$PROJECT_DIR/config/includes.chroot" ]; then
    cp -r "$PROJECT_DIR/config/includes.chroot/"* config/includes.chroot/ 2>/dev/null || true
fi

# Copy hooks
if [ -d "$PROJECT_DIR/config/hooks" ]; then
    cp -r "$PROJECT_DIR/config/hooks/"* config/hooks/ 2>/dev/null || true
fi

echo "=== Configuration complete ==="
echo "Run ./build/build.sh to build the ISO."
