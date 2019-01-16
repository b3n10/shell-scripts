#!/bin/bash

get_wifi_status() {
    mywifi="$( ip addr show | grep 192 )"

    if [ ! -n "$mywifi" ]; then
        echo  "❎$sep"
    fi
}

while true; do

    # https://stackoverflow.com/a/13209479/6353682

    if [ -e /dev/shm/newmail ]; then

        mymail=$( cat /dev/shm/newmail )
        xsetroot -name "$mymail | $( date +'%H:%M:%S' )"

    elif [ -e /dev/shm/volume_status ]; then

        myvol=$( cat /dev/shm/volume_status )
        volmute=$( pactl list sinks | grep Mute | cut -d : -f 2 )
        volstatus=""
        [ $volmute == "yes" ] && volstatus=" MUTE"
        xsetroot -name "$myvol$volstatus"

    elif [ -e /dev/shm/brightness_status ]; then

        mybrt=$( cat /dev/shm/brightness_status )
        xsetroot -name "$mybrt"

    else

        sep="|"
        mymem="m:$(free -m | grep Mem | awk '{ printf "%.0f", ($3 + $5) / $2 * 100 }')%"
        # mymem="M: $(free -m | grep Mem | awk '{ printf "%.0f", ($3 + $5) / $2 * 100 }')%"
        mydsk="d:$(df -H /dev/sda2 | sed '1d' | awk '{print($5)}')"
        # mydsk="🖴 $(df -H /dev/sda2 | sed '1d' | awk '{print($5)}')"
        # myvol="V: $(amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2 }}' | head -n 1)"
        # myvol="v:$(pactl list sinks | grep 'Volume' | cut -d ' ' -f5 | head -n 1)"
        # myvol="🔊$(pactl list sinks | grep 'Volume' | cut -d ' ' -f5 | head -n 1)"
        # brt=$( cat /sys/class/backlight/intel_backlight/brightness )
        # mybrt="b:$(( $brt*100 / 3000 ))%"
        mydate="$( date +'%a, %b %d %Y, %H:%M:%S' )"
        batt_status=''
        [[ `acpi -b | awk '{ print $3 }'` = 'Charging,' ]] && batt_status='+'
        mybatt="$( acpi -b | sed 's/.*[charging|full], \([0-9]*\)%.*/\1/gi' )%$batt_status"

        xsetroot -name "$(get_wifi_status) $mymem $mydsk $sep $mydate $sep $mybatt"
        # xsetroot -name "$(get_wifi_status) $mymem $sep $mydsk $sep $myvol $sep $mybrt $sep $mydate $sep $mybatt"

    fi

    sleep 1s    # Update time every sec

done
