#!/bin/sh
#
#********************************************#
# Installing gedit restore                   #
# Launch from Edit > Preferences > Plugins   #
# and check 'Restore Tabs'                   #
#********************************************#

cd ~
wget https://github.com/raelgc/gedit-restore-tabs/archive/master.zip -O gedit-restore-tabs.zip
unzip gedit-restore-tabs.zip
cd gedit-restore-tabs-master
mkdir -p ~/.local/share/gedit/plugins
cp restoretabs.* ~/.local/share/gedit/plugins/
sudo cp org.gnome.gedit.plugins.restoretabs.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
