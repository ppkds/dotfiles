#!/bin/bash

# Script for fresh Debian based installs.

# Create user specific directories after fresh install of Debian based linux
cd && mkdir -pv Desktop Dev Dev/Git Dev/Git/dotfiles Dev/Practice Dev/Scripts Documents Documents/Original_configs Downloads Music Pictures Public Templates Videos tempdir .config/bat .config/btop .config/htop .config/mc .config/micro .config/nano .config/neofetch .fonts .vim

# Update, upgrade and install useful programs.
cd && sudo apt update && echo && echo "Following programs to be upgraded:" && echo && sudo apt list --upgradeable && echo && read -p "Press any key to continue: " -n 1 -s && echo && sudo apt dist-upgrade -y && echo && echo "Programs not upgradable above are 'not in band' and likely be upgraded during a subsequent upgrade session" && echo && read -p "Press any key to install useful utilities or ^C to cancel: " -n 1 -s && sudo apt install bat btop cheese curl exa git gnupg2 gparted gtkhash htop imagemagick krename krusader mc micro mplayer nemo-gtkhash neofetch pwgen qemu secure-delete speedtest-cli tree vim wget -y
