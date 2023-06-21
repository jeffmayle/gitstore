#!/bin/bash
##
##Post-install-22.04.sh for ubuntu 22.04

##British spell checker
sudo apt install hunspell-en-gb xpad

## Adding software:
sudo apt install htop vim wallch kolourpaint gscan2pdf

##Remove Amazon
sudo rm /usr/share/applications/ubuntu-amazon-default.desktop
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/Amazon.user.js
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/manifest.json

##Adding Keepass2
sudo add-apt-repository -y ppa:eugenesan/ppa && sudo apt-get update && sudo apt-get install keypass2 –y

##Adding Skype 
snap install --classic skype

##Adding Spotify
sudo snap install spotify

##Adding TimeShift
sudo apt-add-repository -y ppa:teejee2008/ppa
sudo apt update; sudo apt install timeshift -y

nautilus -q
