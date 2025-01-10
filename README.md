---

# Instacrack Mining Script

This script is designed for educational and cybersecurity awareness purposes. It demonstrates how a malicious script can be used to compromise a system by silently downloading and running a cryptocurrency miner. It also simulates an Instagram password cracking attack.

> **Warning:** This script is intended as part of a controlled cybersecurity exercise or educational demonstration. Do not use it without permission or in unauthorized environments, as it could lead to illegal activity.

## Features

- **Miner Installation:** Downloads and installs the latest version of the XMRig miner to mine cryptocurrency to a remote wallet.
- **Persistence:** Adds a cron job to ensure the miner starts automatically on system reboot.
- **Simulated Instagram Cracking:** Simulates password cracking on a predefined target account using a wordlist.
- **Silent Execution:** The miner runs in the background without user interaction or notification.

## Requirements

- **Linux-based system** (Ubuntu, Debian, etc.)
- **Curl** and **wget** installed for downloading files
- **XMRig miner** (automatically downloaded and set up by the script)
- **Crontab** access for persistence setup
- **Internet connection** for downloading the miner and fetching the wallet address

## Setup and Usage

1. **Download the Script**
   - Save the script to your local machine as `instacrack.sh`.

2. **Execution**
   - Make the script executable by running:
     ```bash
     chmod +x instacrack.sh
     ```
   - Run the script:
     ```bash
     sudo ./instacrack.sh
     ```

3. **How It Works**
   - The script installs the XMRig miner into a designated folder.
   - It fetches a wallet address from a remote server.
   - A cron job is created to ensure the miner runs on reboot.
   - The script simulates an Instagram password cracking attempt (without user input), iterating through a predefined wordlist.

## Customization

- **Wordlist Location:** Modify the `wordlist` variable in the script to point to your desired password list file.
- **Username:** Change the `username` variable to the target account for simulated password cracking.
- **Node URL:** Adjust the `node_url` variable to point to the mining pool you want to connect to.
- **Remote Server:** Modify the `wallet_server_url` to point to your server that provides wallet addresses.

## Important Notes

- This script is for educational purposes only. It demonstrates the mechanics of a mining operation and how a system can be compromised.
- **Ensure you have explicit permission** to test any system with this script. Unauthorized use is illegal.
- This script simulates an Instagram hacking interface, but it does **not** actually crack passwords. It is just for demonstration purposes.

---
