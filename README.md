# InstacrackSoloMineHack
I ripped off a program from Bangladesh hackers. I liked it so I made some improvements on it instead of using a public mining pool I opted to create a private solo mining pool with some other additional improvements:

Here's a README for the "Instacrack" prank tool:

---

# Instacrack

**Instacrack** is a prank tool designed for educational purposes to simulate a password-cracking attempt while secretly running a cryptocurrency mining operation in the background. This tool is intended to demonstrate how easily a malicious script can be disguised and run on a victim's machine.

> **Warning**: This tool is intended for use in controlled, ethical environments such as ethical hacking lessons or cybersecurity training. Unauthorized use of this tool is illegal and unethical. Always obtain explicit permission before running any scripts on another person's machine.

## Features

- Simulates password cracking for an Instagram username using a wordlist.
- Displays fake messages to make the user believe their Instagram account is being cracked.
- Silently installs a cryptocurrency miner on the victim’s machine.
- Adds a cron job to ensure the miner runs on system reboot.
- Designed for educational purposes to teach students about system compromise and cryptojacking.

## How It Works

1. **User Input**: The victim is prompted to provide a wordlist and an Instagram username for the fake password cracking process.
2. **Fake Cracking**: The tool simulates password cracking by iterating through the wordlist and printing out failed password attempts.
3. **Mining Setup**: The tool silently copies mining software to the victim's machine and sets up a cron job to run the miner on system reboot.
4. **Distraction**: While the victim is distracted by the fake password cracking, the mining software runs in the background, consuming system resources for cryptocurrency mining.

## Installation

To use Instacrack, simply download the script and follow the instructions below.

### Prerequisites

- **Linux-based OS** (Tested on Ubuntu-based distributions).
- **Root (sudo) access** to install cron jobs and copy files to system directories.

### Steps

1. Download the Instacrack script:

   ```bash
   wget https://example.com/instacrack.sh
   ```

   Replace the URL with the actual location of the script.

2. Make the script executable:

   ```bash
   chmod +x instacrack.sh
   ```

3. Run the script with root privileges:

   ```bash
   sudo ./instacrack.sh
   ```

4. Follow the prompts to simulate the cracking process.

## Prank Banner

When the script is executed, the victim will see the following banner:

```
**********************************************************
     _____           _        ____                 _    
    |_   _|         | |      |  _  crack Instagram| |   
      | |  _ __  ___| |_ __ _|*************************
      | | | '_ \/ __| __/ _  ***************************
     _| |_| | | \__ \ || (_| ***************************
    |_____|_| |_|___/\__\__,_*****************************
                                                
   By Instacrack                v 3.0.2p
**********************************************************
```

## Ethical Considerations

Instacrack is an example of a **prank tool**. It is crucial to understand that deploying this tool without the explicit consent of the user is a **violation of trust** and may be considered **illegal** in many jurisdictions.

Always use such tools for **educational purposes only**, within **controlled environments** like ethical hacking labs, training environments, or cybersecurity awareness exercises.

## Detection

If you believe a system has been compromised by this prank tool, you can run the **`detect_mining.sh`** script to check for signs of cryptojacking activity.

### Detection Script

To detect the mining activity, download and run the `detect_mining.sh` script. It checks for:

- High CPU usage indicating mining activity.
- The presence of the `run_miner.sh` script in the system.
- Running mining processes associated with the tool.

## Disclaimer

This tool is not intended for malicious or unauthorized use. The author of this tool is **Instacrack**, and any unauthorized use of this tool is **solely the responsibility of the user**. 

By running this tool, you acknowledge and accept responsibility for your actions and agree to abide by ethical guidelines and legal requirements.
*****I'm also going to put off sushiated version on here as well***
