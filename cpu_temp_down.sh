#!/bin/bash

for i in 0 1 2 3 ; do
    echo 2300000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq ;
done

echo level full-speed > /proc/acpi/ibm/fan
