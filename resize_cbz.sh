#!/bin/bash

if [ -v "$2" ]; then
    echo 'Author not set'
    exit 0
fi

if [ ! -d "/dev/shm/comics" ]; then
    mkdir -p /dev/shm/comics
fi

cp "$1" /dev/shm/comics/

cd /dev/shm/comics

folder=${1:0:10}

unzip "$1"

for i in "$folder"/*.jpg;
do
    echo "file:" "$i"
    convert "$i" -resize 1072x1448\! "$i";

    # if [ -z "$filename" ]; then
    #     filename="${i:2:10}".cbz
    #     # echo "filename: " "$filename"
    # fi
done

filename1="$folder".cbz
# filename2="$folder".epub

zip /tmp/"$filename1" "$folder"/*.jpg

rm /dev/shm/comics/*.cbz

# ebook-convert "$filename1" "$filename2"
#
# cover=`ls "$folder"/*-000.*`
#
# ebook-meta "$filename1" --cover="$cover"
# ebook-meta "$filename2" --cover="$cover"
#
# ebook-meta "$filename2" -a "$2"

# rm *.jpg
