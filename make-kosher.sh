#!/bin/bash

# Update System
sudo apt update && sudo apt upgrade -y
sudo apt  install curl

# change wallpaper
sudo curl https://raw.githubusercontent.com/alltechdev/ubuntu-kosher/main/wallpaper.png --output /usr/share/backgrounds/k-wallpaper.png
sudo chmod 644 /usr/share/backgrounds/k-wallpaper.png
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/k-wallpaper.png

# download and install libreoffice
sudo apt install libreoffice -y

# download and install onlyoffice
wget https://github.com/ONLYOFFICE/DesktopEditors/releases/latest/download/onlyoffice-desktopeditors_amd64.deb
sudo dpkg -i onlyoffice-desktopeditors_amd64.deb
apt --fix-broken install
rm onlyoffice-desktopeditors_amd64.deb

# Download new sudoers file
sudo curl https://raw.githubusercontent.com/alltechdev/ubuntu-kosher/refs/heads/main/sudoers --output /tmp/sudoers

# Install Preconfigured AdGuardHome
sudo mkdir /opt/AdGuardHome
cd /opt/AdGuardHome
sudo wget https://github.com/alltechdev/ubuntu-kosher/raw/refs/heads/main/AdGuardHome.zip
sudo unzip AdGuardHome.zip
sudo rm AdGuardHome.zip
sudo systemctl disable --now systemd-resolved
sudo systemctl stop systemd-resolved 
sudo ./AdGuardHome -s install
sudo systemctl enable AdGuardHome
sudo systemctl start AdGuardHome
sudo ./AdGuardHome -s start


# Remover user from /etc/sudoers
sudo visudo -c -f /tmp/sudoers && sudo cp /tmp/sudoers /etc/sudoers
sudo rm /tmp/sudoers
