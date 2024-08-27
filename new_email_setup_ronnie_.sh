#!/bin/sh
#
#*************************************************#
#         new_email_setup.sh  v1.2                #
#       written by Jeff Mayle, Sept 16, 2022      #
#						    #
# v1.0 Replacing SSMTP with MSMTP.                #
# v1.1 Moving from ~/.msmtprc to /etc/msmtprc.    #
#*************************************************#
# Check https://arnaudr.io/2020/08/24/send-emails-from-your-terminal-with-msmtp/

MSMTPCONF=/etc/msmtprc
ALIASES=/etc/aliases

## Download msmtp and setup
sudo apt install msmtp msmtp-mta -y

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
logfile	~/.msmtp.log

# The SMTP server of your ISP
account gogglemail
host smtp.gmail.com
from sharron.basson@googlemail.com
auth on
user sharron.basson
password 

# Set default account to isp
account default: gogglemail

# Map local users to mail addresses
aliases /etc/aliases
EndofMSMTMPConf

# Set permissons on MSMTPRC  ##CHECK
sudo chown root:msmtp ~/.msmtprc
sudo chmod 640 ~/.msmtprc

sudo tee $ALIASES <<EndofAliasFile >/dev/null
# Send root to Ronnie
root: sharron.basson@googlemail.com
EndofAliasFile

###TESTING THE SCRIPT

(echo "Subject: Test"; echo 'Body of the email') | msmtp sharron.basson@googlemail.com
#cat file.txt | msmtp -a default username@gmail.com
sudo apt-get install mailutils -y
echo "Hello World" | mail -s "Testing 1" sharron.basson@googlemail.com # works
echo 'Testing 2' | mail -s "Hi root" sharron.basson@googlemail.com

echo ; echo ; echo ; echo System email setup successfully! ; echo

exit 0
