#!/usr/bin/env bash
PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"
PLUGIN="pvr.iptvsimple"
GIT_DIR="/home/pi/git/" 
NAME="ithotupdate"

MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
if [ -z "$MY_PATH" ] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1  # fail
fi
echo "$MY_PATH"

echo "###############################################################"
echo "###############################################################"
echo "  HEADS UP: use a right baseline and the right instructions written in README.md file for this baseline"
echo "  Target of this script is 17.4 kodi as base line addon."
echo "  To update it use github repository."
echo "###############################################################"
echo "###############################################################"

mkdir -p $GIT_DIR
cd $GIT_DIR
git clone https://github.com/xbmc/xbmc.git
cd xbmc
#git checkout -b Krypton, not needed really
#git go to latest stable kodi 17.4 **** THIS IS A MUST, OTHERWISE YOU WILL FAIL LATER ON INSTALLING THE ADDON
git checkout 7fc6da0c87414d2ba20055e084adc10546a15b7c  

cd $GIT_DIR
git clone https://github.com/kodi-pvr/pvr.iptvsimple.git $PLUGIN 
cd $PLUGIN 
#git checkout -b Krypton, not needed really.
#git go to latest stable version that matches with kodi 17.4
#FAIL SAFE COMMIT, LATEST TAG
git checkout 2a649d7e21b64c4fa4a8b14c2cc139261eebc7e8  




######### NOTE UPDATE THIS EVERY TIME IS TOO MUCH AND IS TRICKY BECAUSE OF DEPENDS A LOT OF KODI BASELINE, I PREFER TUNE IT MANUALLY WHEN YOU MOVE FROM KODI
#PLS, IF YOU USE KODI REPO BINARY, IT DEPENDS ON YOUR OS, E.G JESSIE LATEST KODI 17.4, HOWEVER KODI LATEST NOW IS KODI 17.7 SO....KEEP CALM AND COMPILE WHEN UPDATE.
$MY_PATH/"$NAME.sh"
#cp "$NAME.sh" /usr/local/bin/
#cp -rf "$NAME.service" /lib/systemd/system/
#chmod 644 /lib/systemd/system/"$NAME.service" 
#systemctl enable ithotupdate.service
#systemctl start ithotupdate.service 
#systemctl status ithotupdate.service 



