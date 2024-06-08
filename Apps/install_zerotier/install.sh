#!/bin/sh

ZERO_TIER_DEST=/opt/zerotier

# Check if previous version exists and remove it
if [ -x "$ZERO_TIER_DEST/uninstall.sh" ]; then
    echo "Removing previous version .."
    "$ZERO_TIER_DEST/uninstall.sh" || { echo "Failed to uninstall previous version."; exit 1; }
fi

# Copy files into destination directory
echo "Copying files into $ZERO_TIER_DEST .."
mkdir -p "$ZERO_TIER_DEST/bin" || { echo "Failed to create directory $ZERO_TIER_DEST/bin"; exit 1; }
cp zerotier-one uninstall.sh "$ZERO_TIER_DEST/bin" || { echo "Failed to copy files."; exit 1; }

# Create symlinks
echo "Creating ZeroTier symlinks .."
cp "$ZERO_TIER_DEST/bin/zerotier-one" /sbin/zerotier-one || { echo "Failed to create symlink /sbin/zerotier-one"; exit 1; }

# Change permissions
chmod +x "$ZERO_TIER_DEST/bin/zerotier-one" || { echo "Failed to change permissions for zerotier-one"; exit 1; }

# Install ZeroTier service
echo "Installing ZeroTier service .."
cp zerotier-init /etc/init.d/zerotier-init || { echo "Failed to copy zerotier-init to /etc/init.d/"; exit 1; }
chmod +x /etc/init.d/zerotier-init || { echo "Failed to change permissions for /etc/init.d/zerotier-init"; exit 1; }

# Add start on boot config to rc.d
ln -s /etc/init.d/zerotier-init  /etc/rc.d/S01zerotier-init 
ln -s /etc/init.d/zerotier-init /etc/rc.d/K01zerotier-init 

# Start ZeroTier service
echo "Starting ZeroTier service .."
/etc/init.d/zerotier-init start || { echo "Failed to start ZeroTier service"; exit 1; }

echo "ZeroTier is installed."
