#!/bin/bash
##
##Post-install-22.04.sh for ubuntu 22.04

##British spell checker
#sudo apt install hunspell-en-gb xpad

##Install Git
#sudo apt install git git-extras

##Change screen appearance and move Unity toolbar
#gsettings set org.gnome.desktop.session idle-delay 3600
#gsettings set org.gnome.desktop.screensaver lock-delay 0
#gsettings set com.canonical.Unity.Launcher launcher-position Bottom

## Adding software:
sudo apt install htop vim wallch kolourpaint gscan2pdf

##Adding Dropbox
#cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_x64" | tar xzf -

##Remove Amazon
sudo rm /usr/share/applications/ubuntu-amazon-default.desktop
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/Amazon.user.js
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/manifest.json

### Launch another terminal window ### NO LONGER NEEDED IN 18.04
#echo '#!/bin/bash' > dropb-launch.sh/
#echo 'skype' >> dropb-launch.sh
#echo '~/.dropbox-dist/dropboxd' >> dropb-launch.sh
#cp dropb-launch.sh /home/$USER/dropb-launch.sh
#chmod +x /home/$USER/dropb-launch.sh
#gnome-terminal -e 'sh -c ./dropb-launch.sh'

##Adding Keepass2
sudo add-apt-repository -y ppa:eugenesan/ppa && sudo apt-get update && sudo apt-get install keypass2 –y

##Adding Skype 
snap install --classic skype

##Adding Spotify
sudo snap install spotify

##Adding MEGAsync ERRORS
echo 'Downloading MEGAsync...'
wget --show-progress --progress=bar:force -q -O https://mega.nz/linux/MEGAsync/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb
echo 'Installing MEGAsync...'
sudo dpkg -i megasync-xUbuntu_22.04_amd64.deb 

##Adding ClipGrab
#sudo add-apt-repository -y ppa:clipgrab-team/ppa && sudo apt-get update && sudo apt-get install clipgrab -y

##Adding TimeShift
sudo apt-add-repository -y ppa:teejee2008/ppa
sudo apt update; sudo apt install timeshift -y

nautilus -q
