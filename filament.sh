#!/bin/sh

NAMENDATEI=Filament_config.sh
. /home/pi/filament_rounout_Repetier/$NAMENDATEI

gpio mode $pin up
gpio mode $pin in

while true
do

result="$( gpio read $pin )"

if [ "$result" = "$sensor" ]; then
echo "Filament rounout"
curl -k "http://$ip:$port/printer/api/$printer?apikey=$apikey&a=send&data=%7B%22cmd%22%3A%22%40pause%20Filament%20Rounout%22%7D%0A%0A%40pause%20Filament%20Rounout"
curl -k "http://$ip:$port/printer/api/$printer?apikey=$apikey&a=send&data=%7B%22cmd%22%3A%22M117%20Filament%20Rounout%22%7D"

fi

sleep 0.5
done
