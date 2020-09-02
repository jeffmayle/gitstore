#!/bin/bash
##
##
## This script backs up my Music folder on my local machine
## to my Mega storage, accessible on my phone,
## and backs up all OGG files to Mega storage.
##

##rclone copy /home/jeff/Music pCloud:My\ Music/

rclone sync /home/jeff/Music Mega:Music_Backup/
