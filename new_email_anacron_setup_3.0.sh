#!/bin/sh
#
#*************************************************#
#         new_email_anacron_setup.sh  v3.0        #
#       written by Jeff Mayle, March 31, 2020     #
#						    #
# Setup ssmtp e-mail and setup an /etc/anacrontab #
#+  to keep all software up-to-date on your       #
#+  machine and email you each day when it runs.  #
# This new version uses variables and less text,  #
#+  outputs /etc/anacrontab and anacronupdate.sh. #
# v1.4 Created apt-updater alias and set to run   #
#+  less frequently (1 a week, opposed to daily). #
# v1.5 Actually implement apt-updater in anacron  #
# v2.0 Not replacing /etc/anacrontab amending it. #
# v3.0 Replacing SSMTP with MSMTP.                #
#*************************************************#

MSMTPCONF=~/.msmtprc
#MSMTPCONF=/etc/.msmtprc
ANACRONTAB=/etc/anacrontab
MYBASH=/home/jeff/.bash_aliases
ALIASES=/etc/aliases

# Get date for insertion into both /etc/anacrontab 
#+ and /home/jeff/.msmtprc script
now=$(date)

## Download mstmp and setup
sudo apt install msmtp msmtp-mta -y
# Get email address into a variable
read -p 'Enter your email address [jeffmayle75@gmail.com]: ' email_address
email_address=${email_address:-jeffmayle75@gmail.com}
#stty -echo
echo Now generate an app password e.g. msmtp@laptop
firefox "https://myaccount.google.com/apppasswords"
printf "Enter the password you have generated: "
read password
#stty echo
printf "\n"
read -p 'Enter your email username [jeffmayle75]:' email_username
email_username=${email_username:-jeffmayle75}

#cat << 'EOF' > $MSMTPCONF
sudo tee $MSMTPCONF <<EndofMSMTMPConf >/dev/null
# Set default values for all following accounts.
defaults

# Use the mail submission port 587 instead of the SMTP port 25.
port 587

# Always use TLS.
tls on

# Set a list of trusted CAs for TLS. The default is to use system settings, but
# you can select your own file.
tls_trust_file /etc/ssl/certs/ca-certificates.crt
logfile	       /var/log/msmtp

# The SMTP server of your ISP
account gmail
host smtp.gmail.com
from $email_address
auth on
user $email_username
password $password

# Set default account to isp
account default: gmail

# Map local users to mail addresses
aliases /etc/aliases
EndofMSMTMPConf

# Set permissons on MSMTPRC
sudo chown root:msmtp ~/.msmtprc
sudo chmod 640 ~/.msmtprc

# Reinstate permissions on ssmtp.conf
#sudo chmod 640 $SSMTPCONF

#Setup aliases file
#touch aliases
#sudo chmod 664 aliases
#echo 'root:jeffmayle75@gmail.com' > aliases
#sudo cp aliases /etc

### Setup update script for UBUNTU
touch anacronupdate.sh
sudo chmod 664 anacronupdate.sh
echo '#!/bin/bash' > anacronupdate.sh
echo "sudo -- sh -c 'apt update && apt upgrade -y && apt autoremove -y'" >> anacronupdate.sh
cp anacronupdate.sh /home/jeff/anacronupdate.sh 
chmod +x /home/jeff/anacronupdate.sh

sudo chmod 664 $ANACRONTAB

if [ -e $ANACRONTAB.backup ]
then
  sudo cp $ANACRONTAB.backup $ANACRONTAB.backup.backup 2>/dev/null
  sudo rm $ANACRONTAB.backup 2>/dev/null 
fi

sudo cp $ANACRONTAB $ANACRONTAB.backup >/dev/null
# echo y | sudo rm $ANACRONTAB  #  sudo tee -a was to append to a file, 
				#+ without the -a to replace
sudo tee $ANACRONTAB <<EndofAnacrontab >/dev/null
# /etc/anacrontab: configuration file for anacron
# 
# See anacron(8) and anacrontab(5) for details.

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
HOME=/root
LOGNAME=root

# These replace cron's entries
1	5	cron.daily	run-parts --report /etc/cron.daily
7	10	cron.weekly	run-parts --report /etc/cron.weekly
@monthly	15	cron.monthly	run-parts --report /etc/cron.monthly

# Added by $USER on $now
7	10	$USER.update		/home/$USER/anacronupdate.sh
1	15	$USER.backup-email	/home/$USER/Dropbox/Linux-stuff/Bash-scripts/Useful/email-contacts-backup_2.0.sh
20	25	$USER.bday_out_clear	/home/$USER/Dropbox/Linux-stuff/Bash-scripts/Useful/bday_out_clearup.sh
1	20	$USER.birthdays		/home/$USER/Dropbox/Linux-stuff/Bash-scripts/Useful/Birthdays/bday.sh
1	23	$USER.birthdays5	/home/$USER/Dropbox/Linux-stuff/Bash-scripts/Useful/Birthdays/bday5.sh
EndofAnacrontab

sudo chmod 644 $ANACRONTAB




#grep -qxF '7	10	jeff.update	/home/jeff/anacronupdate.sh' $ANACRONTAB || echo '# Added by Jeff on $now' >> $ANACRONTAB && echo '5	10	jeff.update	/home/jeff/anacronupdate.sh' >> $ANACRONTAB

#grep -qxF '28	25	jeff.bday_out	/home/jeff/Dropbox/Linux-stuff/Bash-scripts/Useful/bday_out_clearup.sh' /etc/anacrontab || echo '28	25	jeff.bday_out_clear	/home/jeff/Dropbox/Linux-stuff/Bash-scripts/Useful/bday_out_clearup.sh' >> /etc/anacrontab

#grep -qxF '1	20	jeff.birthdays	/home/jeff/Dropbox/Linux-stuff/Bash-scripts/Useful/Birthdays/bday.sh' /etc/anacrontab || echo '1	20	jeff.birthdays	/home/jeff/Dropbox/Linux-stuff/Bash-scripts/Useful/Birthdays/bday.sh' >> /etc/anacrontab

#grep -qxF '1	23	jeff.birthdays5	/home/jeff/Dropbox/Linux-stuff/Bash-scripts/Useful/Birthdays/bday5.sh' /etc/anacrontab || echo '1	23	jeff.birthdays5 /home/jeff/Dropbox/Linux-stuff/Bash-scripts/Useful/Birthdays/bday5.sh' >> /etc/anacrontab

#sudo ln -s '/home/jeff/Dropbox/Languages/Learn-Czech/Do you want to speak Czech?' '/home/jeff/Desktop/Do you want to speak Czech?'

#sudo ln -s '/home/jeff/Dropbox/Linux-stuff/Linux-Documentation2.odt' '/home/jeff/Desktop/Linux-Documentation2.odt'

#sudo chmod 644 $ANACRONTAB

## Adding alias to use just before 'apt install...' as in now runs less often

#sudo tee $MYBASH <<EndofConfFile >/dev/null 
#function apt-updater {
#	sudo apt update# &&
#	sudo apt upgrade -y &&
#	sudo apt autoremove -y
#	}
#EndofConfFile

echo ; echo ; echo ; echo System email and /etc/anacrontab setup successfully! ; echo

exit 0
