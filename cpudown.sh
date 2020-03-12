#!/bin/bash

for i in 0 1 2 3 ; do
    echo 3000000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq ;
done

echo level full-speed > /proc/acpi/ibm/fan

su - ben -c "echo '0' > /dev/shm/cpudown_delay"
