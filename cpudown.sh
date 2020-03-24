#!/bin/bash

for i in 0 1 2 3 ; do
    echo 2300000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq ;
done

echo level 6 > /proc/acpi/ibm/fan
# echo level full-speed > /proc/acpi/ibm/fan

su - ben -c "echo '0' > /dev/shm/cpudown_delay"

# 95MB webm rendered file takes:
# 2:15 (2.8GHz at 76C)
# 2:24 (2.6GHz at 72C)
# 2:37 (2.4GHz at 69C)

# 160Mb rendered file
#
# no config: 3:39 93C
# 2.6, lvl 7 fan: 4:22 80C
# 2.3, lvl 7 fan: 4:54 72C
