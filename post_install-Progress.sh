#!/bin/bash
##
##Post-install-Progress.sh for ubuntu 16.04


##British spell checker
sudo apt install hunspell-en-gb xpad

##Install Git
sudo apt-get install git git-extras -y

##Prolong battery and prevent overheating
sudo apt install tlp tlp-rdw
sudo tlp start 

##Change screen appearance and move Unity toolbar
gsettings set org.gnome.desktop.session idle-delay 3600
gsettings set org.gnome.desktop.screensaver lock-delay 0
gsettings set com.canonical.Unity.Launcher launcher-position Bottom

## Adding software:
sudo apt-get install dconf-tools powertop htop vim cheese gksu synergy -y

##Adding Dropbox
#cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_x64" | tar xzf -

##Remove Amazon
sudo rm /usr/share/applications/ubuntu-amazon-default.desktop
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/Amazon.user.js
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/manifest.json

### Launch another terminal window ### NO LONGER NEEDED IN 18.04
echo '#!/bin/bash' > dropb-launch.sh/
echo 'skype' >> dropb-launch.sh
echo '~/.dropbox-dist/dropboxd' >> dropb-launch.sh
cp dropb-launch.sh /home/$USER/dropb-launch.sh
chmod +x /home/$USER/dropb-launch.sh
#gnome-terminal -e 'sh -c ./dropb-launch.sh'

##Adding Keepass2
sudo add-apt-repository -y ppa:eugenesan/ppa && sudo apt-get update && sudo apt-get install keypass2 –y

##Adding Skype 
snap install --classic skype

##Adding Spotify
##sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free" && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D2C19886 && sudo apt-get update -qq && sudo apt-get install spotify-client -y
sudo snap install spotify

##Adding Amarok music player
#sudo apt-get install amarok

##Adding MEGAsync ERRORS
echo 'Downloading MEGAsync...'
wget --show-progress --progress=bar:force -q -O https://mega.nz/linux/MEGAsync/xUbuntu_16.04/amd64/megasync-xUbuntu_16.04_amd64.deb
echo 'Installing MEGAsync...'
sudo dpkg -i megasync-xUbuntu_16.04_amd64.deb 

##Adding ClipGrab
sudo add-apt-repository -y ppa:clipgrab-team/ppa && sudo apt-get update && sudo apt-get install clipgrab -y

##Adding Wunderlistux 
# Download package and install from there

##Adding TimeShift
sudo apt-add-repository -y ppa:teejee2008/ppa
sudo apt update; sudo apt install timeshift -y

## Restart nautilus (req. to activate elementary):
nautilus -q

## Altering settings power management:
gconftool-2 --set --type string	/apps/gnome-power-manager/critical_battery		shutdown
gconftool-2 --set --type bool	/apps/gnome-power-manager/battery_reduce		false
gconftool-2 --set --type bool	/apps/gnome-power-manager/idle_dim_battery		false
gconftool-2 --set --type string	/apps/gnome-power-manager/lid_ac			blank
gconftool-2 --set --type string	/apps/gnome-power-manager/lid_battery			blank
gconftool-2 --set --type string	/apps/gnome-power-manager/sleep_computer_ac		0
gconftool-2 --set --type string	/apps/gnome-power-manager/sleep_computer_battery	0
gconftool-2 --set --type string	/apps/gnome-power-manager/power				interactive

