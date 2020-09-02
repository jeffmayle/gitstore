#!/bin/bash
##
##
## This script 

sudo bash -c `echo "deb [arch=i386,amd64] http://linux.dropbox.com/ubuntu bionic main" > /etc/apt/sources.list.d/dropbox.list`

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
# incase of error
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E

sudo apt update
sudo apt install python3-gpg dropbox

dropbox start -i

