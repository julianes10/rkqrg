PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"
chmod 755 ./*.sh
cp tchotupdate.sh /usr/local/bin/
cp -rf tchotupdate.service /lib/systemd/system/

mkdir -p /home/pi/git
cd /home/pi/git 
apt-get install git
apt-get install ant
git clone https://github.com/tvalacarta/tvalacarta.git

chmod 644 /lib/systemd/system/tchotupdate.service 
systemctl enable tchotupdate.service
systemctl start tchotupdate.service 
systemctl status tchotupdate.service 
