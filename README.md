# Trimui Smart Pro - ZeroTier VPN Support

## Overview

This guide provides details on how ZeroTier VPN support was integrated into the Trimui Smart Pro console. ZeroTier offers a secure and efficient way to create a virtual private network (VPN), allowing the Trimui Smart Pro to connect seamlessly to other devices over the internet as if they were on the same local network.

## Features

- **Secure Connectivity:** Leveraging ZeroTier's robust security features to ensure data privacy and secure connections.
- **Seamless Integration:** ZeroTier VPN support has been smoothly integrated into the Trimui Smart Pro firmware, providing an out-of-the-box solution for VPN connectivity.
- **Pre-configured Network:** The system comes with a pre-configured network setup, simplifying the connection process for users.

## Installation and Setup

### Prerequisites

- Trimui Smart Pro console
- A ZeroTier account
- Network ID from your ZeroTier network

### Steps to Enable ZeroTier VPN

1. **Replace Network ID:**
   The file `up_zerotier/up.sh` needs to be updated with your specific ZeroTier network ID. Locate the line in the script that contains `YOUR_ZEROTIER_ID` and replace it with your actual network ID.

   ```sh
   export ZEROTIER_ID="YOUR_ZEROTIER_ID"
   ```

2. **Execute the Script:**
   Copy Apps folder to the root of your TSP SDCARD.
   Follow these steps to install and manage ZeroTier:

   - **Install ZeroTier:** Run the "Install ZeroTier" app (this needs to be done only once).
   - **Join Network:**
     1. Run the "Up ZeroTier" app.
     2. Run the "Join ZeroTier" app.
     3. Check your ZeroTier dashboard to confirm a successful connection.
   - **Leave Network:**
     - Run the "Leave ZeroTier" command.
   - **Uninstall ZeroTier:**
     - Execute the uninstallation script to remove ZeroTier from your device.

3. **Verify Connection:**
   After running the script, verify that the Trimui Smart Pro is connected to the ZeroTier network. You can do this via the ZeroTier management console or using the ZeroTier CLI commands via telnet.

4. **Recomendations**
   Try to use 192.x.x.x range, works better.
---

By following the steps outlined above, you can successfully set up and utilize ZeroTier VPN on your Trimui Smart Pro console. With future improvements, the integration can become even more seamless and user-friendly.