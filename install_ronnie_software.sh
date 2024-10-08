#!/bin/bash

# Installing git

sudo apt update && sudo apt upgrade
sudo apt install git

# Installing Google Chrome on Ubuntu 24.04 LTS

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

#sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb
sudo apt install ~/Downloads/google-chrome-stable_current_amd64.deb

# Installing kdenlive for Ubuntu 24.04

sudo add-apt-repository ppa:kdenlive/kdenlive-stable -y
sudo apt update
sudo apt install kdenlive
kdenlive --version

# Installing gimp

sudo add-apt-repository ppa:ubuntuhandbook1/gimp -y
sudo apt update
sudo apt install gimp

# Installing qbittorrent

sudo apt update && sudo apt upgrade
sudo apt install dirmngr ca-certificates software-properties-common apt-transport-https
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y
sudo apt update
sudo apt install qbittorrent

# Installing VMC Media Player

sudo apt update && sudo apt upgrade
sudo add-apt-repository ppa:ubuntuhandbook1/vlc -y
sudo apt update
sudu apt install vlc

# Installing Gnome-browser-connector CHECK!!!!
sudo apt-get install gnome-browser-connector
#git clone https://gitlab.gnome.org/GNOME/gnome-browser-connector.git

sudo apt install meson 
git clone https://github.com/andyholmes/gnome-shell-extension-gsconnect.git
cd gnome-shell-extension-gsconnect/
meson setup _build .
ninja -C _build install-zip

# Installing Tor Browser on Ubuntu 24.04 LTS

sudo apt install tor torbrowser-launcher

# Getting surfshark debian-install.sh

curl -f https://downloads.surfshark.com/linux/debian-install.sh --output surfshark-install.sh #gets the installation script
# cat surfshark-install.sh #show script's content
sh surfshark-install.sh #installs surfshark


