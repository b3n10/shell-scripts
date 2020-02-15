#!/bin/bash

sudo rtcwake -m mem -t $(date +%s -d "today ${1}") && bz && crd --restart
