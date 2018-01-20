#!/usr/bin/env bash
PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"

PLUGIN="plugin.video.SportsDevil"
GIT_DIR="/home/pi/git/" 
TARGET_DIR="/opt/retropie/configs/ports/kodi/addons"
TO_ZIP_DIR=$PLUGIN 

logger "$0 Updating addon SC..."
cd $GIT_DIR/$PLUGIN
git pull
if [ -d "$TARGET_DIR/$PLUGIN" ]; then
  logger "$0 Hot updating addon..."
  cp -rf * "$TARGET_DIR/$PLUGIN/"
  chown -R pi:pi "$TARGET_DIR/$PLUGIN/"
fi
logger "$0 Generate zip file "$PLUGIN.zip" ..."
cd ..
zip -r "$PLUGIN.zip" $PLUGIN   
chown pi:pi "$PLUGIN.zip"
logger "$0 addon SC updated"

