#!/bin/bash
#
# This will add the lines to anacrontab if missing
# (run with sudo) 

grep -qxF '1	20	jeff.birthdays	/home/jeff/Dropbox/Linux-stuff/Bash-scripts/Useful/Birthdays/bday.sh' /etc/anacrontab || echo '1	20	jeff.birthdays	/home/jeff/Dropbox/Linux-stuff/Bash-scripts/Useful/Birthdays/bday.sh' >> /etc/anacrontab

grep -qxF '1	23	jeff.birthdays5	/home/jeff/Dropbox/Linux-stuff/Bash-scripts/Useful/Birthdays/bday5.sh' /etc/anacrontab || echo '1	23	jeff.birthdays5 /home/jeff/Dropbox/Linux-stuff/Bash-scripts/Useful/Birthdays/bday5.sh' >> /etc/anacrontab
