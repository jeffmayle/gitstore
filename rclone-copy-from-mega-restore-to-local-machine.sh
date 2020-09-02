#!/bin/bash
##
##
## This script restores my Music folder on my local machine
## from mega cloud storage
##
##

##rclone copy /home/jeff/Music pCloud:My\ Music/

rclone copy Mega:Music_Backup /home/jeff/Music
