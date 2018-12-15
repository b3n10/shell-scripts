#!/bin/bash

# chown ben /sys/class/backlight/intel_backlight/brightness
declare -i brightness=`cat /sys/class/backlight/intel_backlight/brightness`

if [ $1 == "+" ]; then
    declare -i value=$brightness+50
else
    declare -i value=$brightness-50
fi

tee /sys/class/backlight/intel_backlight/brightness <<< $value
