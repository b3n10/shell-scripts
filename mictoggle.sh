!#/bin/bash

MIC_LED_STATUS=$( amixer sget Capture | grep -w off )

if [ -n $MIC_LED_STATUS ]; then
    amixer sset Capture nocap
else
    amixer sset Capture cap
fi
