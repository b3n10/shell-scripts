#!/bin/bash

while true; do

    # https://stackoverflow.com/a/13209479/6353682

    sep="|"

    mymem="M: $(free -m | grep Mem | awk '{ printf "%.0f", ($3 + $5) / $2 * 100 }')%"

    mydsk="🖴 $(df -H /dev/sda2 | sed '1d' | awk '{print($5)}')"

    # myvol="V: $(amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2 }}' | head -n 1)"
    myvol="🔊$(pactl list sinks | grep 'Volume' | cut -d ' ' -f5 | head -n 1)"

    brt=$( cat /sys/class/backlight/intel_backlight/brightness )
    mybrt="☀$(( $brt*100 / 3000 ))%"

    mydate="$( date +'%a, %b %d %Y | %H:%M:%S' )"

    batt_status=''
    [[ `acpi -b | awk '{ print $3 }'` = 'Charging,' ]] && batt_status='+'
    mybatt="$( acpi -b | sed 's/.*[charging|full], \([0-9]*\)%.*/\1/gi' )%$batt_status"

    get_wifi_status() {
        mywifi="$( ip addr show | grep 192 )"

        if [ -n "$mywifi" ]; then
            echo " 🖧$sep"
        else
            echo  "❎$sep"
        fi
    }

    xsetroot -name "$(get_wifi_status) $mymem $sep $mydsk $sep $myvol $sep $mybrt $sep $mydate $sep $mybatt"

    sleep 1s    # Update time every sec

done
