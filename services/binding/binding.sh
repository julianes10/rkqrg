LOG=/home/pi/booting.log
>$LOG

mkdir -p /mnt/nfsserver/sg2
echo "\nBooting...">$LOG

ls /media/SG2>>$LOG
mount --bind /media/SG2  /mnt/nfsserver/sg2
ls /mnt/nfsserver/sg2>>$LOG
/etc/init.d/nfs-kernel-server restart
echo "\nEND Booting">>$LOG

