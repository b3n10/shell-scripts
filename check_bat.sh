#!/bin/bash

state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | head -1)
percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | head -1)
st=(${state//:/ })
pc=(${percentage//:/ })
p=${pc[1]//%/ }

# should say 'charging'
# echo ${st[1]}
# should say number without %
# echo $p

if [[ ${st[1]} == "discharging" && "$p" -le 18 ]]; then
    # /usr/bin/paplay /home/ben/scripts/system-fault.ogg
    # touch /dev/shm/testbat
    echo 0 > /dev/null
fi
