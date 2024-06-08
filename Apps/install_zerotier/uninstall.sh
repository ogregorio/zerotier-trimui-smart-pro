#!/bin/sh

ZEROTIER_DEST=/opt/zerotier

# Stop ZeroTier service
echo "Stopping ZeroTier service .."
/etc/init.d/zerotier-init stop || { echo "Failed to stop ZeroTier service"; exit 1; }

# Remove ZeroTier service
echo "Removing ZeroTier service .."
rm /etc/init.d/zerotier-init || { echo "Failed to remove ZeroTier service"; exit 1; }

# Remove symlinks
echo "Removing ZeroTier symlinks .."
rm /sbin/zerotier-cli || { echo "Failed to remove symlink /sbin/zerotier-cli"; exit 1; }
rm /sbin/zerotier-one || { echo "Failed to remove symlink /sbin/zerotier-one"; exit 1; }

# Remove start on boot
rm /etc/rc.d/S01zerotier-init 
rm /etc/rc.d/K01zerotier-init 

# Remove files
echo "Removing ZeroTier files .."
rm -rf "$ZEROTIER_DEST" || { echo "Failed to remove ZeroTier files"; exit 1; }

echo "ZeroTier is uninstalled."