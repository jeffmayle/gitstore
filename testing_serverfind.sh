#!/bin/sh
#
#*************************************************#
#         new_email_anacron_setup.sh  v2.0        #
#       written by Jeff Mayle, March 31, 2020     #
#						  #
# Setup ssmtp e-mail and setup an /etc/anacrontab #
#+     to keep all software up-to-date on your    #
#+   machine and email you each day when it runs. #
# This new version uses variables and less text,  #
#+  outputs /etc/anacrontab and anacronupdate.sh. #
# v1.4 Created apt-updater alias and set to run   #
#   less frequently (1 a week, opposed to daily). #
# v1.5 Actually implement apt-updater in anacron  #
# v2.0 Not replacing /etc/anacrontab amending it. #
#*************************************************#

SSMTPCONF=/etc/ssmtp/ssmtp.conf
ANACRONTAB=/etc/anacrontab
MYBASH=$HOME/.bash_aliases  ### Will this $HOME work without quotes?

## Download apt
#sudo apt-get install apt -y

## Download ssmtp
#sudo apt install ssmtp git -y
# Get email address into a variable
read -p 'Enter your email address [jeffmayle75@gmail.com]: ' email_address
email_address=${email_address:-jeffmayle75@gmail.com}
stty -echo
#printf "Enter your email password (it will not be displayed): "
#read password
stty echo
#printf "\n"
read -p 'Enter your email username (generally name before the @) [jeffmayle75]:' email_username
email_username=${email_username:-jeffmayle75}
#echo '(Ignore the two error lines below)'

grep -o "[[:alnum:][:graph:]]*@[[:alnum:][:graph:]]*" $email_address | grep -o "[[:alnum:][:graph:]]@" | sed -e `s/@//g` >> email_server
echo $email_server

echo $email_address
