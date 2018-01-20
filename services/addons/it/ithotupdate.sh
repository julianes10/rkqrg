#!/usr/bin/env bash
PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"

logger "$0 Updating addon IT..."

cd /home/pi/git/xbmc
git pull
cd /home/pi/git/pvr.iptvsimple 
git pull
rm -rf build
mkdir -p build
cd build
cmake -DADDONS_TO_BUILD=pvr.iptvsimple -DADDON_SRC_PREFIX=../.. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=../../xbmc/addons -DPACKAGE_ZIP=1 ../../xbmc/cmake/addons
make package-pvr.iptvsimple

mkdir -p /opt/retropie/configs/ports/kodi/addons/pvr.iptvsimple/
cp -rf /home/pi/git/target/python/kodi-17-krypton/pvr.iptvsimple/* /opt/retropie/configs/ports/kodi/addons/pvr.iptvsimple/
chown -R pi:pi /opt/retropie/configs/ports/kodi/addons/pvr.iptvsimple/
logger "$0 addon IT updated"



