#!/usr/bin/env bash
PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"

PLUGIN="plugin.video.SportsDevil"
GIT_DIR="/home/pi/git/" 
NAME="sdhotupdate"


cp "$NAME.sh" /usr/local/bin/
cp -rf "$NAME.service" /lib/systemd/system/

mkdir -p $GIT_DIR
cd $GIT_DIR
sudo apt-get install git
git clone https://github.com/boudabass/SportsDevil.git $PLUGIN 

chmod 644 /lib/systemd/system/"$NAME.service" 
systemctl enable "$NAME.service"
systemctl start  "$NAME.service"
systemctl status "$NAME.service"

