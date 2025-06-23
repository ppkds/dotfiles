#!/bin/bash

# Script for fresh Debian based installs. Run after first install of OS.

# Update, upgrade and install useful programs.
clear 
echo ""
echo "Updating, upgrading and installing useful packages. Enter SU password to continue: `echo $'\n '`" 
cd 
sudo apt update 
echo ""
echo "Following packages are going to be upgraded:" 
echo ""
sudo apt list --upgradeable 
echo ""
read -p "Press any key to continue: `echo $'\n'`" -n 1 -s 
sudo apt dist-upgrade -y 
echo ""
echo "Kept back packages are 'not in band' and are likely to be upgraded during a subsequent upgrade session" 
echo ""
read -p "Press any key to install useful utilities or ^C to cancel: `echo $'\n '`" -n 1 -s 
sudo apt install -y bat btop cheese curl exa git gnupg2 gparted gtkhash htop imagemagick krename krusader mc micro mplayer nemo-gtkhash neofetch pwgen qemu secure-delete speedtest-cli tree vim wget xdg-utils 
echo ""
read -p "Udated and installed packages. Press any key to continue creating directories -- OR -- press ^C to cancel: "

# Create directories.
clear 
cd 
read -p "Creating Directories. Press any key to continue: `echo $'\n '`" -n 1 -s 
cd 
mkdir -pv Desktop Dev Dev/Git Dev/Git/dotfiles Dev/Git/vim Dev/Git/yt-dlp  Dev/Practice Dev/Scripts Documents Documents/Original_configs Downloads Music Pictures Public Templates Videos tempdir .config/bat .config/btop .config/htop .config/mc .config/micro .config/nano .config/neofetch .fonts .vim 
echo ""

# Clone essential repositories
cd
clear
read -p "Directories created. Press any key to clone essential Github repositories `echo $'\n'`" -n 1 -s 
cd $HOME/Dev/Git
echo ""
echo "Cloning $USER's dotfiles" # user's dotfiles
git clone https://github.com/ppkds/dotfiles.git
echo ""
echo "Cloning vim" # vim repository to build latest versions of vim
git clone --depth 1 https://github.com/vim/vim.git
echo ""
echo "Cloning yt-dlp" # CL based Youtube downloader (use alias eg: alias yt-dlp='$HOME/Dev/Git/yt-dlp/yt-dlp.sh') (IMPORTANT: python 3 needs to be installed to use this script)
git clone --depth 1 https://github.com/yt-dlp/yt-dlp.git
cd 
echo ""

# Create SSH key
read -p "Github cloning completed. Press any key to continue creating SSH key -- OR -- press ^C to cancel: "


# Check for existing SSH keys
clear
echo ""
read -p "Checking existing ssh keys. Press any key to continue: `echo $'\n'`" -n 1 -s  
ls -al ~/.ssh

# Setup new private SSH key
ssh-keygen -t ed25519 -C "user@domain.com"

# Add SSH key to SSH agent
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_ed25519

# Add SSH key to Github 
cat ~/.ssh/id_ed25519.pub
echo ""
read -p "To add SSH key to Github -- Go to https://github.com/settings/keys -- Press 'New SSH key' button to add new SSH key to Github. Then copy and paste the contents of the SSH displayed key above to dialog box on the website. Press any key when ready..." -n 1 -s
echo ""
