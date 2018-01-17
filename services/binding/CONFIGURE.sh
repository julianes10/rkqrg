#!/usr/bin/env bash
PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"
chmod 755 ./*.sh

cp binding.sh /usr/local/bin/

cp -rf binding.service /lib/systemd/system/
chmod 644 /lib/systemd/system/binding.service 
systemctl enable binding.service
systemctl start binding.service 
systemctl status binding.service 


