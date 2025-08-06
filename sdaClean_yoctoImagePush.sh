#!/bin/bash

set -e

IMAGE_FILE="$1"
DEVICE="$2"

usage() {
    echo "Usage: $0 <path-to-image.wic> <device>"
    echo "Example: $0 tmp/deploy/images/beaglebone/core-image-sato-beaglebone.wic /dev/sdX"
    exit 1
}

# Check arguments
[[ -z "$IMAGE_FILE" || -z "$DEVICE" ]] && usage
[[ ! -f "$IMAGE_FILE" ]] && { echo "Error: Image file $IMAGE_FILE not found."; exit 1; }
[[ ! -b "$DEVICE" ]] && { echo "Error: Device $DEVICE not found."; exit 1; }

# User confirmation
echo "==============================================="
echo " ⚠️  WARNING: This will ERASE ALL DATA on $DEVICE"
echo " Image to be written: $IMAGE_FILE"
echo "==============================================="
read -p "Type YES to proceed: " confirm
[[ "$confirm" != "YES" ]] && { echo "Aborted."; exit 1; }

# Unmount any mounted partitions
echo "Unmounting $DEVICE partitions..."
sudo umount "${DEVICE}"* || true

# Wipe all partition signatures
echo "Wiping partition table and filesystem signatures..."
sudo wipefs -a "$DEVICE"

# Zero the beginning of the device
echo "Zeroing first 10MB..."
sudo dd if=/dev/zero of="$DEVICE" bs=1M count=10 conv=fsync status=progress

# Flash the .wic image
echo "Flashing $IMAGE_FILE to $DEVICE..."
sudo dd if="$IMAGE_FILE" of="$DEVICE" bs=4M conv=fsync status=progress

# Final sync
sync

echo "✅ Done! SD card is ready for BeagleBone Black boot."

