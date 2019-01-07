#!/bin/bash

sum=0; for i in $(ss -tuna | awk '{print($4)}' | sed -n '1!p'); do $sum=$sum+$i 2> /dev/null; done; echo $sum
