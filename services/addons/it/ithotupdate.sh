#!/usr/bin/env bash
PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"

PLUGIN="pvr.iptvsimple"
GIT_DIR="/home/pi/git/" 
TARGET_DIR="/opt/retropie/configs/ports/kodi/addons"
TO_ZIP_DIR=$PLUGIN 

logger "$0 Updating addon $PLUGIN..."
#DON'T DARE DO THIS cd /home/pi/git/xbmc
#DON'T DARE DO THIS git pull
cd $GIT_DIR/$PLUGIN
# DON'T DARE DO THIS UNLESS SOMTHING IS NOT WORKING OK, IT PROBABLY WON'T COMPILE IN YOUR BASELINE
# git checkout master
# git pull
# git checkout -b Krypton

#### REBUILT THE STUFF

######### THIS INSTRUCTIONS SHALL BE ALLIGNED WITH KODI BASE LINE AND README.MD OF COMMIT YOU DOWNLOAD PVR
######### THIS IS COMPATIBLE WITH 17.4 TAG AND  2.4.14-Krypton
rm -rf build
mkdir -p build
cd build
cmake -DADDONS_TO_BUILD=pvr.iptvsimple -DADDON_SRC_PREFIX=../.. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=../../xbmc/addons -DPACKAGE_ZIP=1 ../../xbmc/project/cmake/addons
make package-pvr.iptvsimple

mv -f /home/pi/git/pvr.iptvsimple/build/pvr.iptvsimple-prefix/src/pvr.iptvsimple-build/addon-pvr.iptvsimple-2.4.14.zip $GIT_DIR
chown pi:pi "*.zip"
logger "$0 addon $PLUGIN updated"





