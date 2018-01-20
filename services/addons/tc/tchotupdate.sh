#!/usr/bin/env bash
PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"

PLUGIN="plugin.video.tvalacarta"
GIT_DIR="/home/pi/git/" 
TARGET_DIR="/opt/retropie/configs/ports/kodi/addons"
TO_ZIP_DIR=/home/pi/git/target/python/kodi-17-krypton/$PLUGIN

ZIP=/home/pi/git/target/python/tvalacarta-kodi-krypton-4.0.6.zip


logger "$0 Updating addon $PLUGIN..."
cd $GIT_DIR/$PLUGIN
cd python
ant git pull
ant clean
ant copy-kodi-17-krypton
if [ -d "$TARGET_DIR/$PLUGIN" ]; then
  logger "$0 Hot updating addon..."
  cp -rf $TO_ZIP_DIR/* "$TARGET_DIR/$PLUGIN/"
  chown -R pi:pi "$TARGET_DIR/$PLUGIN/"
fi
logger "$0 Generate zip file "$PLUGIN.zip" ..."
cd ..
mv -f $ZIP zip $GIT_DIR
chown pi:pi "$PLUGIN.zip"
logger "$0 addon $PLUGIN updated"



