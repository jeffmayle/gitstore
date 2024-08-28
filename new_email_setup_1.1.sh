#!/bin/sh
#
#*************************************************#
#         new_email_setup.sh  v1.1                #
#       written by Jeff Mayle, Sept 16, 2022      #
#						    #
# v1.0 Replacing SSMTP with MSMTP.                #
# v1.1 Moving from ~/.msmtprc to /etc/msmtprc.    #
#*************************************************#

MSMTPCONF=/etc/msmtprc
ALIASES=/etc/aliases

## Download mstmp and setup
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
account gmail
host smtp.gmail.com
from jeffmayle75@gmail.com
auth on
user jeffmayle75
password wesqhsutjgxvyrdu #ubuntu-box (laptop)

#password wesqhsutjgxvyrdu #ubuntu-box (laptop)
#password oykwaattjpwzmglz #ubuntu desktop

# Set default account to isp
account default: gmail

# Map local users to mail addresses
aliases /etc/aliases
EndofMSMTMPConf

# Set permissons on MSMTPRC ##CHECK!!!
sudo chown root:msmtp ~/.msmtprc
sudo chmod 640 ~/.msmtprc

sudo tee $ALIASES <<EndofAliasFile >/dev/null
# Send root to Jeff
root: jeffmayle75@gmail.com
EndofAliasFile

###TESTING THE SCRIPT

(echo "Subject: Test"; echo 'Body of the email') | msmtp jeffmayle75@gmail.com
#cat file.txt | msmtp -a default username@gmail.com
sudo apt-get install mailutils -y
echo "Hello World" | mail -s "Testing 1" jeffmayle75@gmail.com # works
echo 'Testing 2' | mail -s "Hi root" jeffmayle75@gmail.com

echo ; echo ; echo ; echo System email setup successfully! ; echo

exit 0
