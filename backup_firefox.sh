#!/bin/sh

# backup firefox profile
# any .default profile in firefox directory

fileName1=/dev/shm/ffx-work-$( date +'%m%d%Y-%H%M%S' ).tar.gz
tar -zcvf $fileName1 ~/.mozilla/firefox/*.default/ && echo "Done archiving: $fileName1"

fileName2=/dev/shm/ffx-personal-$( date +'%m%d%Y-%H%M%S' ).tar.gz
tar -zcvf $fileName2 ~/.mozilla/firefox/*.personal/ && echo "Done archiving: $fileName2"
