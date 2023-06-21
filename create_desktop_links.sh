#!/bin/bash

## Create Desktop links

DOYOUWANT=Do\ you\ want\ to\ speak\ Czech?
CZECHFOR=Czech\ for\ English\ Speakers
CZECHFORFOR=Czech\ for\ Foreigners
GRATEFUL=Grateful.odt
LINUX=Linux-Documentation2.odt
REASONS=Reasons\ to\ be\ cheerful.odt
RECIPES=Recipes.odt
TODO=To\ do.ods
TRUST=Trustees.desktop
BRAVE=Brave.desktop
CZSOURCE=~/Dropbox/Languages/Learn-Czech
LINSOURCE=~/Dropbox/Linux-stuff
DBSOURCE=~/Dropbox
DL=~/Downloads
TSOURCE=$LINSOURCE/Bash-scripts
D=~/Desktop
TFULL=$D/$TRUST
BFULL=$D/$BRAVE

if [ ! -h "$D/$BRAVE" ]; then
	echo '[Desktop Entry]' > $BFULL
	echo 'Name=Brave' >> $BFULL
	echo 'Comment=This launches the Brave browser after NordVPN' >> $BFULL
	echo 'Exec=/home/jeff/Dropbox/Linux-stuff/Bash-scripts/Useful/Temp/czvpn.sh' >> $BFULL
	echo 'Icon=/home/jeff/Dropbox/Pictures/brave-lion.png' >> $BFULL
	echo 'Terminal=true' >> $BFULL
	echo 'Type=Application' >> $BFULL
fi

if [ ! -h "$D/$TRUST" ]; then
#	ln -s $TSOURCE/$TRUST $D/
	echo '[Desktop Entry]' > $TFULL
	echo 'Name=Trustees Meeting' >> $TFULL
	echo 'Comment=This launches the Zoom call' >> $TFULL
	echo 'Exec=/home/jeff/Dropbox/Linux-stuff/Bash-scripts/trustees.sh' >> $TFULL
	echo 'Icon=/home/jeff/Dropbox/Pictures/headway-resize.jpg' >> $TFULL
	echo 'Terminal=false' >> $TFULL
	echo 'Type=Application' >> $TFULL
	echo 'Name[en_GB]=Trustees Meeting' >> $TFULL
fi

if [ ! -h "$D/$DOYOUWANT" ]; then
	ln -s "$CZSOURCE/$DOYOUWANT" $D/
fi

if [ ! -h "$D/$CZECHFOR" ]; then
	ln -s "$CZSOURCE/$CZECHFOR" $D/
fi

if [ ! -h "$D/$CZECHFORFOR" ]; then
	ln -s "$CZSOURCE/$CZECHFORFOR" $D/
fi

if [ ! -h "$D/$LINUX" ]; then
	ln -s $LINSOURCE/$LINUX $D/
fi

if [ ! -h "$D/$GRATEFUL" ]; then
	ln -s $DBSOURCE/$GRATEFUL $D/
fi

if [ ! -h "$D/$REASONS" ]; then
	ln -s "$DBSOURCE/$REASONS" $D/
fi

if [ ! -h "$D/$TODO" ]; then
	ln -s "$DBSOURCE/$TODO" $D/
fi

if [ ! -h "$D/$RECIPES" ]; then
	ln -s $DBSOURCE/$RECIPES $D/
fi

if [ ! -h "$D/$DL" ]; then
	ln -s $DL $D/ >/dev/null
fi
