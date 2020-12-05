#!/bin/bash

# find . -name *.cbr -type f -exec extract_convert {} \;

7z x "$1"

zip_name=""

for i in *.jpg;
do
    convert "$i" -resize 1072x1448\! "$i";
    # echo $i

    if [ -z "$zip_name" ]; then
        zip_name="Naruto v${i:0:3}"
    fi
done

# echo $zip_name.cbz

zip "$zip_name".cbz *.jpg

rm *.jpg
