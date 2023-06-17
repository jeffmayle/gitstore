#!/bin/bash
##
##Post-install-Progress_20.04.sh for ubuntu 20.04

##British spell checker and stuff
sudo apt install hunspell-en-gb xpad git git-extras tlp tlp-rdw htop vim cheese -y

##Prolong battery and prevent overheating
sudo tlp start 

##Change screen appearance and move Unity toolbar
gsettings set org.gnome.desktop.session idle-delay 900
gsettings set org.gnome.desktop.screensaver lock-delay 3600
#gsettings set com.canonical.Unity.Launcher launcher-position Bottom # this no longer works in 20.04

##Adding Skype 
snap install --classic skype

##Adding Spotify
sudo snap install spotify
