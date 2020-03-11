#!/bin/bash

for i in 0 1 2 3 ; do echo 3400000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq ; done
echo level auto > /proc/acpi/ibm/fan
