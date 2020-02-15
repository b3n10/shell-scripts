#!/bin/bash

sudo rtcwake -m mem -t $(date +%s -d "tomorrow ${1}") && bz && crd --restart
