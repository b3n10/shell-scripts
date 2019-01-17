#!/usr/bin/bash

myvol=" VOL: $( pactl list sinks | grep 'Volume' | cut -d ' ' -f5 | head -n 1 )"

echo $myvol > /dev/shm/volume_status
echo "0" > /dev/shm/volume_delay
