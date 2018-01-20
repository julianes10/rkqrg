#Pre-requisite
PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"
chmod 755 ./*.sh
cp sdhotupdate.sh /usr/local/bin/
cp -rf sdhotupdate.service /lib/systemd/system/

mkdir -p /home/pi/git
cd /home/pi/git 
sudo apt-get install git
git clone https://github.com/boudabass/SportsDevil.git



chmod 644 /lib/systemd/system/sdhotupdate.service 
systemctl enable sdhotupdate.service
systemctl start sdhotupdate.service 
systemctl status sdhotupdate.service 
