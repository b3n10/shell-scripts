#!/bin/bash

state=$(upower -d | grep state | head -1)
percentage=$(upower -d | grep percentage | head -1)
st=(${state//:/ })
pc=(${percentage//:/ })
p=${pc[1]//%/ }

# should say 'charging'
# echo ${st[1]}
# should say number without %
# echo $p

if [[ ${st[1]} == "charging" && "$p" -ge 95 ]]; then
    /usr/bin/paplay /home/ben/scripts/0237.wav
    touch /dev/shm/testbat
fi
