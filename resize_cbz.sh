#!/bin/bash

folder=${1:0:12}

unzip "$1" -x

filename=""

for i in "$folder"/*.jpg;
do
    # echo "file: " "$i"
    convert "$i" -resize 1072x1448\! "$i";

    if [ -z "$filename" ]; then
        filename="${i:2:10}".cbz
        # echo "filename: " "$filename"
    fi
done

zip "$filename" "$folder"/*.jpg

# rm *.jpg
