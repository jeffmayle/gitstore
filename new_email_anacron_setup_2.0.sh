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
sudo apt install ssmtp git -y
# Get email address into a variable
read -p 'Enter your email address [jeffmayle75@gmail.com]: ' email_address
email_address=${email_address:-jeffmayle75@gmail.com}
stty -echo
printf "Enter your email password (it will not be displayed): "
read password
stty echo
printf "\n"
read -p 'Enter your email username (generally name before the @) [jeffmayle75]:' email_username
email_username=${email_username:-jeffmayle75}
##echo '(Ignore the two error lines below)'

grep -o “[[:alnum:][:graph:]]*@[[:alnum:][:graph:]]*” FILE | grep -o “@[[:alnum:][:graph:]]*” | sed -e ‘s/@//g’

export HOSTNAME
my_hostname="$( hostname )"

# Get date for insertion into both /etc/anacrontab 
#+ and /etc/ssmtp/ssmtp.conf script
now=$(date)

# Drop permissions on the ssmtp.conf file
sudo chmod 676 $SSMTPCONF

sudo cp $SSMTPCONF $SSMTPCONF.backup >/dev/null
sudo tee $SSMTPCONF <<EndofConfFile >/dev/null 
#
# Config file for sSMTP sendmail
#
# The person who gets all mail for userids < 1000
# Make this empty to disable rewriting.
#
# Edited by $USER on $now
root=$email_address

# The place where the mail goes. The actual machine name is required no 
# MX records are consulted. Commonly mailhosts are named mail.domain.com
mailhub=smtp.gmail.com:465

# Where will the mail seem to come from?
rewriteDomain=gmail.com

# The full hostname
hostname=$my_hostname
##hostname=localhost

# Are users allowed to set their own From: address?
# YES - Allow the user to specify their own From: address
# NO - Use the system generated From: address
FromLineOverride=YES

AuthUser=$email_username
AuthPass=$password
UseTLS=YES
EndofConfFile

# Reinstate permissions on ssmtp.conf
sudo chmod 640 $SSMTPCONF

### Setup daily update script for UBUNTU
echo '#!/bin/bash' > anacronupdate.sh
##echo "sudo -- sh -c 'apt update && apt upgrade -y && apt autoremove -y'" >> anacronupdate.sh
echo 'apt-updater' >> anacronupdate.sh
cp anacronupdate.sh /home/$USER/anacronupdate.sh 
chmod +x /home/$USER/anacronupdate.sh

sudo chmod 664 $ANACRONTAB

if [ -e $ANACRONTAB.backup ]
then
  sudo cp $ANACRONTAB.backup $ANACRONTAB.backup.backup 2>/dev/null
  sudo rm $ANACRONTAB.backup 2>/dev/null 
fi

sudo cp $ANACRONTAB $ANACRONTAB.backup >/dev/null
# echo y | sudo rm $ANACRONTAB  #  sudo tee -a was to append to a file, 
				#+ without the -a to replace

grep -qxF '7	10	$USER.update	/home/$USER/anacronupdate.sh' $ANACRONTAB || echo '# Added by $USER on $now' >> $ANACRONTAB && echo '7	10	$USER.update	/home/$USER/anacronupdate.sh' >> $ANACRONTAB


#sudo tee $ANACRONTAB <<EndofAnacrontab >/dev/null
## /etc/anacrontab: configuration file for anacron
## 
## See anacron(8) and anacrontab(5) for details.

#SHELL=/bin/sh
#PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
#HOME=/root
#LOGNAME=root

## These replace cron's entries
#1	5	cron.daily	run-parts --report /etc/cron.daily
#7	10	cron.weekly	run-parts --report /etc/cron.weekly
#@monthly	15	cron.monthly	run-parts --report /etc/cron.monthly

## Added by $USER on $now
#7	10	$USER.update	/home/$USER/anacronupdate.sh
#EndofAnacrontab

sudo chmod 644 $ANACRONTAB

## Adding alias to use just before 'apt install...' as in now runs less often

sudo tee $MYBASH <<EndofConfFile >/dev/null 
function apt-updater {
	sudo apt update &&
	sudo apt upgrade -y &&
	sudo apt autoremove -y
	}
EndofConfFile

## No-more-secrets install, not needed but playing

git clone https://github.com/bartobri/no-more-secrets.git && cd ./no-more-secrets && make nms && make sneakers && sudo make install >/dev/null
cd ..
sleep 10
echo
echo 'New /etc/anacrontab file contents'
echo '---------------------------------'
echo
cat /etc/anacrontab | nms -a
echo ; echo ; echo ; echo 
echo 'New anacronupdate.sh file contents'
echo '----------------------------------'
echo
cat /home/$USER/anacronupdate.sh | nms -a
echo ; echo ; echo ; echo System email and /etc/anacrontab setup successfully! ; echo

exit 0
