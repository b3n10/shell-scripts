#!/bin/sh

# https://wiki.archlinux.org/index.php/FFmpeg#Screen_capture
ffmpeg -f x11grab -video_size 1366x768 -framerate 25 -i :0 -f alsa -i default -c:v libx264 -preset ultrafast -c:a aac /dev/shm/$( date +'%m%d%Y-%H%M%S' ).mp4

