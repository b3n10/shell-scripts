#!/bin/bash

amixer set Master toggle

status="$(amixer get Master | grep off)"

if [[ -n $status ]]; then
    amixer set Headphone mute
    amixer set Speaker mute
else
    amixer set Headphone unmute
    amixer set Speaker unmute
fi
