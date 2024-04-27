#!/bin/bash

# Script for fresh Debian based installs. Run after first install of OS.

# Update, upgrade and install useful programs.
clear && echo && echo "Updating, upgrading and installing useful programs. Enter SU password to continue: `echo $'\n '`" && cd && sudo apt update && echo && echo "Following packages are going to be upgraded:" && echo && sudo apt list --upgradeable && echo && read -p "Press any key to continue: `echo $'\n'`" -n 1 -s && sudo apt dist-upgrade -y && echo && echo "'Kept Back' packages are 'not in band' and are likely to be upgraded during a subsequent upgrade session" && echo && read -p "Press any key to install useful utilities or ^C to cancel: `echo $'\n '`" -n 1 -s && sudo apt install bat btop cheese curl exa git gnupg2 gparted gtkhash htop imagemagick krename krusader mc micro mplayer nemo-gtkhash neofetch pwgen qemu secure-delete speedtest-cli tree vim wget xdg-utils -y && echo && read -p "Udated and installed. Press any key to continue creating directories -- OR -- press ^C to cancel: "

# Create directories.
clear && cd && read -p "Creating Directories. Press any key to continue: `echo $'\n '`" -n 1 -s && cd && mkdir -pv Desktop Dev Dev/Git Dev/Git/dotfiles Dev/Practice Dev/Scripts Documents Documents/Original_configs Downloads Music Pictures Public Templates Videos tempdir .config/bat .config/btop .config/htop .config/mc .config/micro .config/nano .config/neofetch .fonts .vim && echo && read -p "Directories created. Press any key to continue creating SSH key and enable cloning from Github -- OR -- press ^C to cancel: "

clear

# Check for existing SSH keys
ls -al ~/.ssh

# Setup new private SSH key
ssh-keygen -t ed25519 -C "user@domain.com"

# Add SSH key to SSH agent
ssh-add ~/.ssh/id_ed25519

# Add SSH key to Github 
read -p "Add SSH key to Github -- Go to https://github.com/settings/keys -- Press 'New SSH key' button to add new SSH key to Github. Then copy and paste the contents of the SSH displayed key below to dialog box on the website. Press any key when ready..." -n 1 -s
cat ~/.ssh/id_ed25519.pub
