#!/usr/bin/env bash
PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"
PLUGIN="pvr.iptvsimple"
GIT_DIR="/home/pi/git/" 
NAME="ithotupdate"


cp "$NAME.sh" /usr/local/bin/
cp -rf "$NAME.service" /lib/systemd/system/

mkdir -p $GIT_DIR
cd $GIT_DIR
git clone https://github.com/xbmc/xbmc.git
cd xbmc
git checkout -b Krypton

cd $GIT_DIR
git clone https://github.com/kodi-pvr/pvr.iptvsimple.git $PLUGIN 
cd $PLUGIN 
git checkout -b Krypton


chmod 644 /lib/systemd/system/"$NAME.service" 
######### NOTE UPDATE THIS EVERY TIME IS TOO MUCH
/usr/local/bin/"$NAME.sh"
#systemctl enable ithotupdate.service
#systemctl start ithotupdate.service 
#systemctl status ithotupdate.service 


