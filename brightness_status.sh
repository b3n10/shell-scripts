#!/bin/bash

brt=$( cat /sys/class/backlight/intel_backlight/brightness )
mybrt="BRIGHT: $(( $brt*100 / 3000 ))%"

echo $mybrt > /dev/shm/brightness_status
echo "0" > /dev/shm/brightness_delay
