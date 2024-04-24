#!/bin/bash

# Script for fresh Debian based installs.

# Create user specific directories after initial install of Debian based linux
mkdir -pv Desktop Dev Dev/Git Dev/Git/dotfiles Dev/Practice Dev/Scripts Documents Documents/Original_configs Downloads Music Pictures Public Templates Videos tempdir .config/bat .config/btop .config/htop .config/mc .config/micro .config/nano .config/neofetch .fonts .vim

# Update, upgrade and install useful programs.
sudo apt update && echo && echo "Following programs to be upgraded:" && echo && sudo apt list --upgradeable && echo && read -p "Press any key to continue: " -n 1 -s && echo && sudo apt dist-upgrade -y && echo && echo "Programs not upgradable above are 'not in band' and likely will be upgraded during a subsequent upgrade session" && echo && read -p "Press any key to install useful utilities or ^C to cancel: " -n 1 -s && sudo apt install bat btop cheese curl exa git gnupg2 gparted htop imagemagick mc micro mplayer neofetch qemu tree vim wget -y
