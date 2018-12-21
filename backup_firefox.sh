#!/bin/sh

# backup firefox profile
# any .default profile in firefox directory

fileName=/dev/shm/ffx-$( date +'%m%d%Y-%H%M%S' ).tar.gz
tar -zcvf $fileName ~/.mozilla/firefox/*.default/ && echo "Done archiving: $fileName"
