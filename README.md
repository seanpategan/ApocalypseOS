# ApocalypseOS

A security-hardened Linux distribution designed to function fully offline. After installation, Wi-Fi, Bluetooth, and all wireless interfaces are permanently disabled at the kernel level. Ships with local AI models via Ollama, encrypted backups with BorgBackup, VSCodium for development, and offline coding guides — everything you need with no internet dependency.

Built for those who prioritize security, privacy, and resilience.

## Features

- **Wireless Lockdown** — Wi-Fi, Bluetooth, and all wireless modules are blacklisted at the kernel level after installation. A systemd service enforces this on every boot.
- **Local AI** — Ollama is installed during setup. The installer detects your hardware (RAM, GPU, disk) and recommends appropriate models (llama3, codellama, mistral, phi3, tinyllama).
- **Encrypted Backups** — BorgBackup with automatic encryption. One command to back up, one to restore.
- **Offline Development** — VSCodium, GCC, Python 3, Node.js, Git, and offline coding guides ship with the OS.
- **Printing Support** — CUPS pre-installed with a setup helper for USB and network printers.
- **Hardened by Default** — UFW firewall denies all traffic. AppArmor enforced. Full-disk encryption supported via LUKS/cryptsetup.
- **XFCE Desktop** — Lightweight, fast, and functional.

## Building the ISO

### Requirements

- A **Debian 12 (Bookworm)** system (or VM)
- Root access
- `live-build` and `debootstrap` installed
- ~10GB free disk space

### Steps

```bash
# 1. Install build dependencies
sudo apt update
sudo apt install -y live-build debootstrap

# 2. Clone this repo
git clone https://github.com/seanpategan/ApocalypseOS.git
cd ApocalypseOS

# 3. Configure the build
chmod +x build/*.sh
sudo ./build/config.sh

# 4. Build the ISO
sudo ./build/build.sh

# 5. The ISO will be at: live-image-amd64.hybrid.iso
```

### Testing

```bash
# Test in QEMU
qemu-system-x86_64 -cdrom live-image-amd64.hybrid.iso -m 4G -enable-kvm

# Or write to USB
sudo dd if=live-image-amd64.hybrid.iso of=/dev/sdX bs=4M status=progress
```

## Post-Install Usage

### First-Time Setup

The setup wizard runs automatically on first boot (or manually via the desktop shortcut). It will:

1. Temporarily enable Wi-Fi for downloads
2. Detect your hardware and recommend local AI models
3. Download selected Ollama models
4. Permanently disable all wireless interfaces
5. Lock down the firewall

```bash
sudo apocalypseos-setup
```

### Encrypted Backups

```bash
# Back up to an external drive
sudo apos-backup /mnt/usb/backup

# Restore from backup
sudo apos-restore /mnt/usb/backup
```

### Printer Setup

```bash
sudo apos-printer-setup
```

### Offline Coding Guides

```bash
apos-guides
```

Or open from the desktop shortcut. Guides are available for Python, C, JavaScript, Git, and using local AI for coding.

### Re-Lock Wireless (Safety Net)

```bash
sudo apos-lockdown
```

## Project Structure

```
ApocalypseOS/
├── build/                          # Build system scripts
│   ├── config.sh                   # live-build configuration
│   ├── build.sh                    # Build wrapper
│   └── clean.sh                    # Cleanup
├── config/
│   ├── package-lists/              # Packages to include
│   │   ├── base.list.chroot
│   │   ├── desktop.list.chroot
│   │   ├── security.list.chroot
│   │   ├── development.list.chroot
│   │   └── printing.list.chroot
│   ├── includes.chroot/            # Files overlaid onto the live filesystem
│   │   ├── etc/
│   │   │   ├── modprobe.d/         # Wireless module blacklist
│   │   │   ├── ufw/               # Firewall config
│   │   │   ├── skel/              # Default user dotfiles
│   │   │   └── systemd/system/    # Lockdown service
│   │   └── usr/
│   │       ├── local/bin/          # ApocalypseOS scripts
│   │       └── share/
│   │           ├── applications/   # Desktop shortcuts
│   │           └── doc/apocalypseos/guides/  # Offline docs
│   └── hooks/live/                 # Build-time hooks
└── LICENSE
```

## License

MIT License. See [LICENSE](LICENSE).
