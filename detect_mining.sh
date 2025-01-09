#!/bin/bash

# This script checks for signs of cryptojacking activity

# Define some variables to store system status
mining_indicator="run_miner.sh"  # Mining script name (from Instacrack)

# Function to check CPU usage
check_cpu_usage() {
    echo "Checking for abnormal CPU usage..."
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    if (( $(echo "$cpu_usage > 80" | bc -l) )); then
        echo "Warning: High CPU usage detected: $cpu_usage%"
    else
        echo "CPU usage is normal: $cpu_usage%"
    fi
}

# Function to check for mining process running in the background
check_mining_process() {
    echo "Checking for mining process..."
    mining_process=$(ps aux | grep "$mining_indicator" | grep -v "grep")
    if [ -n "$mining_process" ]; then
        echo "Malicious mining process detected!"
        echo "$mining_process"
    else
        echo "No malicious mining process found."
    fi
}

# Function to check for the mining script in known locations
check_mining_script() {
    echo "Checking for suspicious scripts in Documents..."
    home_directory=$(getent passwd $USER | cut -d: -f6)
    mining_script_path="$home_directory/Documents/res/run_miner.sh"

    if [ -f "$mining_script_path" ]; then
        echo "Found suspicious script: $mining_script_path"
        echo "This could be the malicious miner installed by Instacrack."
    else
        echo "No suspicious script found in Documents."
    fi
}

# Main function to run checks
echo "Starting cryptojacking detection..."

# Perform checks
check_cpu_usage
check_mining_process
check_mining_script

echo "Detection complete."
