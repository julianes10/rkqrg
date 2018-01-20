PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"
chmod 755 ./*.sh

cp ithotupdate.sh /usr/local/bin/
cp -rf ithotupdate.service /lib/systemd/system/

mkdir -p /home/pi/git
cd /home/pi/git 
apt-get install git

git clone https://github.com/xbmc/xbmc.git
cd /home/pi/git/xbmc
git checkout -b Krypton

git clone https://github.com/kodi-pvr/pvr.iptvsimple.git
cd /home/pi/git/pvr.iptvsimple
git checkout -b Krypton

chmod 644 /lib/systemd/system/ithotupdate.service 
#Note, only manual running, takes so much time
/usr/local/bin/ithotupdate.sh
#systemctl enable ithotupdate.service
#systemctl start ithotupdate.service 
#systemctl status ithotupdate.service 


