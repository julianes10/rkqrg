#!/usr/bin/env bash
PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"

logger "$0 Updating addon TC..."

cd /home/pi/git/tvalacarta 
git pull
ant clean
ant copy-kodi-17-krypton
mkdir -p /opt/retropie/configs/ports/kodi/addons/plugin.video.tvalacarta/
cp -rf /home/pi/git/target/python/kodi-17-krypton/plugin.video.tvalacarta/* /opt/retropie/configs/ports/kodi/addons/plugin.video.tvalacarta/
chown -R pi:pi /opt/retropie/configs/ports/kodi/addons/plugin.video.tvalacarta/
logger "$0 addon TC updated"



