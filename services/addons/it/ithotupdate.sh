#!/usr/bin/env bash
PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"

PLUGIN="pvr.iptvsimple"
GIT_DIR="/home/pi/git/" 
TARGET_DIR="/opt/retropie/configs/ports/kodi/addons"
TO_ZIP_DIR=$PLUGIN 

logger "$0 Updating addon IT..."
cd /home/pi/git/xbmc
git pull
cd $GIT_DIR/$PLUGIN
git pull

#### REBUILT THE STUFF

rm -rf build
mkdir -p build
cd build
cmake -DADDONS_TO_BUILD=pvr.iptvsimple -DADDON_SRC_PREFIX=../.. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=../../xbmc/addons -DPACKAGE_ZIP=1 ../../xbmc/cmake/addons
make package-pvr.iptvsimple


if [ -d "$TARGET_DIR/$PLUGIN" ]; then
  logger "$0 Hot updating addon... TODO"
#  cp -rf * "$TARGET_DIR/$PLUGIN/"
#  chown -R pi:pi "$TARGET_DIR/$PLUGIN/"
fi
logger "$0 Generate zip file "$PLUGIN.zip" ..."
cd ..
zip -r "$PLUGIN.zip" $PLUGIN   
chown pi:pi "$PLUGIN.zip"
logger "$0 addon SC updated"




mkdir -p /opt/retropie/configs/ports/kodi/addons/pvr.iptvsimple/
cp -rf /home/pi/git/target/python/kodi-17-krypton/pvr.iptvsimple/* /opt/retropie/configs/ports/kodi/addons/pvr.iptvsimple/
chown -R pi:pi /opt/retropie/configs/ports/kodi/addons/pvr.iptvsimple/
logger "$0 addon IT updated"



