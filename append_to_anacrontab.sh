#!/bin/bash
#
# This will add the lines to anacrontab if missing
# and insert Desktop softlinks for Dropbox

sudo grep -qxF '1	20	jeff.birthdays	/home/jeff/Dropbox/Linux-stuff/Bash-scripts/Useful/Birthdays/bday.sh' /etc/anacrontab || echo '1	20	jeff.birthdays	/home/jeff/Dropbox/Linux-stuff/Bash-scripts/Useful/Birthdays/bday.sh' >> /etc/anacrontab

sudo grep -qxF '1	23	jeff.birthdays5	/home/jeff/Dropbox/Linux-stuff/Bash-scripts/Useful/Birthdays/bday5.sh' /etc/anacrontab || echo '1	23	jeff.birthdays5 /home/jeff/Dropbox/Linux-stuff/Bash-scripts/Useful/Birthdays/bday5.sh' >> /etc/anacrontab

sudo ln -s '/home/jeff/Dropbox/Languages/Learn-Czech/Do you want to speak Czech?' '/home/jeff/Desktop/Do you want to speak Czech?'

sudo ln -s '/home/jeff/Dropbox/Linux-stuff/Linux-Documentation2.odt' '/home/jeff/Desktop/Linux-Documentation2.odt'
