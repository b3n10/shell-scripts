#!/bin/bash

# cd /dev/shm
# find . -name *.cbr -exec resize_cbr {} \;

filename="$1"
newfilename=`echo $filename | cut -d '(' -f1`
file_extension=${filename##*.}

shopt -s extglob
newfilename=${newfilename%%*( )}
shopt -u extglob

newfilename=${newfilename:2}.cbz

if [ "$file_extension" == "cbr" ];
then
    7z x "$1"
else
    unzip "$1"
fi

for i in *.jpg;
do
    echo "file:" "$i"
    convert "$i" -resize 1072x1448\! "$i";
done

zip ${newfilename} *.jpg

rm *.jpg
