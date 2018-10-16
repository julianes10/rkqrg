# rkqrgs
Retropie and kodi quick restore guide and scrips

## Introduction

This is just to recover quickly a pi from scratch with the following stuff:
* Retropie 
* Kodi  (***booting first)
* Miscelaneus features
** Improvement for sharing files connectivity (nfs settings)
** keep update from git some kodi stuff


The repo consists of basically a guide (this readme file to not forget the steps) and some scripts

## Base installation
Download [retropie|https://retropie.org.uk/download/] as base system for raspberry (raspbian flavour). Burn an SD (>2G) e.g: 

sudo dd if=retropie-4.3-rpi2_rpi3.img of=/dev/mmcblk0

## Wifi setup (if pi3)
Wifi settings is a must so that que can access ssh later from a laptop, install new things and get any update.
It can be manually using GUI on retropie
On the other hand you can setup in this file: e.g 
/etc/wpa_supplicant/wpa_supplicant.conf 
country=ES
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
network={
	ssid="SSIDone"
	psk="pepito"
}
network={
	ssid="SSIDtwo"
	psk="cetanito"
}
Even, this file can be created in your laptop mounting your fresh burned SD.

Alternatively you can select wifi on configuration menu using GUI

## Resize SD
It comes for free, just boot with your SD on rpi, it resize to use the total space of your SD.  It also can be done in raspi-config.

## Setup raspi-config
Connect a keyboard and a gamepad, it will helps.

Once retropie boots,it ask to you for setup gamepad. Follow the instruction on screen, you probably fail but now worries, you can repeat the setting later, the key thing is allow you move in the menu and push accept and back buttons. 

Usual things: change password for pi user, hostname. 
By default, it boots without ssh enabled, so first steps, go to configuration menu, raspi-config and there enable running ssh.
It is good time for tunning locale settings, language, timezone, keyboard layout and so on 

## Setup retropie
In configuration menu, select retropie configuration.
General OS update can be done. It takes more than 30 minutes, to grab a cup of coffee...
Install basic installation with main a core packages. Again, it takes some time... 
Later select optional packages like e.g kodi.
On boot options, select kodi to boot first (my prefered option). When you exit kodi, retropie will start.

## Intalling roms
There is a lot of info to transfer roms, to me straightforward way is just copying files to right folder. To know extensions and right path copy files take a look to specific emulator on this wiki e.g: 
https://github.com/retropie/retropie-setup/wiki/MAME  
Once you put roms on folders, if emulator has been installed (from core or main setup or optional package), after a reboot (or emulation station restart), the games will be available from GUI.

## Setup kodi
Typical settings must include:
* Allow external control (typical yatsee app in your android)
* Subtitles configuration and addons
* youtube addon

Some helper scripts for managing some addons included in this repo.

## Miscelaneous settings

Automount with usb stick label. https://github.com/six-k/automount-usb.git
Include in this repo as submodule. Run it with sudo ./CONFIGURE.sh
For transmission daemon setings remember just install
apt-get install transmmission-daemon
And tune in etc the setting or copy the one in this repo

### Sharing files form USB disk with nfs
#### Mount usb disk with bind 
Useful for sharing media files from usb hard disk over nfs

#### NFS server settings
apt-get install nfs-common nfs-kernel-server

Copy file from this repo to share files structure on your local network using nfs. Pls notice it is unsecure.
sudo cp etc/exports /etc/exports
sudo systemctl restart nfs-kernel-server.service nfs-common.service 
sudo update-rc.d rpcbind enable && sudo update-rc.d nfs-common enable

## Interesting links and repos
[retropie for download | https://retropie.org.uk]
[retropie repos| https://github.com/retropie]
[kodi | https://kodi.tv/]





