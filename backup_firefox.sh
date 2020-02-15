#!/bin/sh

# backup firefox profile
# any .default or .personal profile in firefox directory

cd ~/.mozilla/firefox/

fileName1=/dev/shm/ffx-work-$( date +'%m%d%Y' ).tar.gz
tar -zcvf $fileName1 *.default/ && echo "Done archiving: $fileName1"

fileName2=/dev/shm/ffx-personal-$( date +'%m%d%Y' ).tar.gz
tar -zcvf $fileName2 *.personal*/ && echo "Done archiving: $fileName2"
