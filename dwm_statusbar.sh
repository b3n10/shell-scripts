#!/bin/bash
# https://stackoverflow.com/a/13209479/6353682

get_wifi_status() {
    mywifi="$( ip addr show | grep 168 )"

    if [ ! -n "$mywifi" ]; then
        echo  "❎$sep"
    fi
}

main_text=""

while true; do
    if [ -e /dev/shm/volume_status ]; then
        # if $DELAY is unset or has a value of 2, then reset value (0) by getting it from file
        [[ -z $DELAY || $DELAY -eq 2 ]] && DELAY=$( cat /dev/shm/volume_delay )

        myvol=$( cat /dev/shm/volume_status )
        volmute=$( pactl list sinks | grep Mute | cut -d : -f 2 )
        volstatus=""
        [ $volmute == "yes" ] && volstatus=" MUTE"
        main_text="$myvol$volstatus"

        # increment variable
        DELAY=$((DELAY+1))

        # if $DELAY has a value of 2, remove files
        if [[ $DELAY -eq 2 ]]; then
            rm /dev/shm/volume_status
            rm /dev/shm/volume_delay
        fi
    elif [ -e /dev/shm/brightness_status ]; then
        # if $DELAY is unset or has a value of 2, then reset value (0) by getting it from file
        [[ -z $DELAY || $DELAY -eq 2 ]] && DELAY=$( cat /dev/shm/brightness_delay )

        mybrt=$( cat /dev/shm/brightness_status )
        main_text="$mybrt"

        # increment variable
        DELAY=$((DELAY+1))

        # if $BRT_DELAY has a value of 2, remove files
        if [[ $DELAY -eq 2 ]]; then
            rm /dev/shm/brightness_status
            rm /dev/shm/brightness_delay
        fi
    elif [ -e /dev/shm/newmail ]; then
        mymail=$( cat /dev/shm/newmail )
        main_text="$mymail | $( date +'%H:%M:%S' )"
    elif [ -e /dev/shm/cpunormal_delay ]; then
        [[ -z $DELAY || $DELAY -eq 2 ]] && DELAY=$( cat /dev/shm/cpunormal_delay )

        main_text="CPU THROTTLE NORMAL"

        DELAY=$((DELAY+1))

        if [[ $DELAY -eq 2 ]]; then
            sudo rm /dev/shm/cpunormal_delay
        fi
    elif [ -e /dev/shm/cpudown_delay ]; then
        [[ -z $DELAY || $DELAY -eq 2 ]] && DELAY=$( cat /dev/shm/cpudown_delay )

        main_text="CPU THROTTLE DOWN"

        DELAY=$((DELAY+1))

        if [[ $DELAY -eq 2 ]]; then
            sudo rm /dev/shm/cpudown_delay
        fi
    else
        # mydsk="🖴 $(df -H /dev/sda2 | sed '1d' | awk '{print($5)}')"
        # myvol="V: $(amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2 }}' | head -n 1)"
        # myvol="🔊$(pactl list sinks | grep 'Volume' | cut -d ' ' -f5 | head -n 1)"
        # brt=$( cat /sys/class/backlight/intel_backlight/brightness )
        # mybrt="b:$(( $brt*100 / 3000 ))%"
        # xsetroot -name "$(get_wifi_status) $mymem $sep $mydsk $sep $myvol $sep $mybrt $sep $mydate $sep $mybatt"

        sep="|"
        mytemp="T:$(sed 's/000$/°C/' /sys/class/thermal/thermal_zone0/temp)"
        mymem="M:$(free -m | grep Mem | awk '{ printf "%.0f", ($3 + $5) / $2 * 100 }')%"
        mydsk="D:$(df -H /dev/sda2 | sed '1d' | awk '{print($5)}')"
        mydate="$( date +'%a, %b %d %Y, %H:%M:%S' )"
        batt_status=''
        [[ `acpi -b | awk '{ print $3 }'` = 'Charging,' ]] && batt_status='+'
        mybatt="$( acpi -b | sed 's/.*[charging|full], \([0-9]*\)%.*/\1/gi' )%$batt_status"
        main_text="$(get_wifi_status) $mytemp $mymem $mydsk $sep $mydate $sep $mybatt"
    fi

    xsetroot -name "$main_text"
    sleep 1s    # Update time every sec
done
