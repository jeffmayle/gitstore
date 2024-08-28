#!/bin/bash
##
##
## This script restores my Music folder on my local machine
## from mega cloud storage
##
##

##rclone copy /home/jeff/Music pCloud:My\ Music/

sudo apt install rclone

# Now connect to Mega
echo "Connect Mega with rclone"
echo .
echo "Press [ENTER] to continue"
read -s < /dev/tty

rclone copy Mega:Music_Backup /home/jeff/Music
