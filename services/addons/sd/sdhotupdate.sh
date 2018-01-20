#!/usr/bin/env bash
PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"

logger "$0 Updating SC..."
cd /home/pi/git/SportsDevil 
git pull
mkdir -p /opt/retropie/configs/ports/kodi/addons/plugin.video.SportsDevil/
cp -rf * /opt/retropie/configs/ports/kodi/addons/plugin.video.SportsDevil/
chown -R pi:pi /opt/retropie/configs/ports/kodi/addons/plugin.video.SportsDevil/
logger "$0 Updating SC done"

