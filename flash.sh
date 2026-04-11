#!/usr/bin/env bash
set -euo pipefail

FIRMWARE_DIR="$HOME/Downloads/firmware"
MOUNT_POINT="/mnt/aurora30"

usage() {
    echo "Usage: $0 <left|right|reset>"
    exit 1
}

[[ $# -ne 1 ]] && usage

case "$1" in
    left)  FILE="aurora30_left-nice_nano_v2-zmk.uf2" ;;
    right) FILE="aurora30_right-nice_nano_v2-zmk.uf2" ;;
    reset) FILE="settings_reset-nice_nano_v2-zmk.uf2" ;;
    *) usage ;;
esac

FIRMWARE_PATH="$FIRMWARE_DIR/$FILE"

if [[ ! -f "$FIRMWARE_PATH" ]]; then
    echo "Error: firmware file not found: $FIRMWARE_PATH"
    exit 1
fi

# Auto-detect the Nice!Nano bootloader drive (FAT volume labeled NICENANO)
DEVICE=$(lsblk -o NAME,LABEL -rn | awk '$2 == "NICENANO" {print "/dev/" $1}')

if [[ -z "$DEVICE" ]]; then
    echo "Error: NICENANO device not found. Is the Nice!Nano in bootloader mode?"
    exit 1
fi

echo "Flashing $FILE to $DEVICE..."
sudo mkdir -p "$MOUNT_POINT"
sudo mount "$DEVICE" "$MOUNT_POINT"
sudo cp "$FIRMWARE_PATH" "$MOUNT_POINT"
sync
sudo umount "$MOUNT_POINT"
echo "Done."
