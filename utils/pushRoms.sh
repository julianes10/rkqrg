#!/usr/bin/env bash
echo "Using '$1' first parameter as source host to rsync"

PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"

rsync -avhr ssh /home/pi/Retropie/roms/  pi@$1:/home/pi/Retropie/roms/ 
# TODO -delete
# TODO Should restart retropie


