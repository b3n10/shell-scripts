#!/bin/bash

comicbookname=$1

test -d $comicbookname || mkdir -p $comicbookname

cover=""
appendname=""

# for i in *.zip ; do
for i in *.zip ; do
    foldername="${i%.*}";
    test -n "$appendname" || appendname="$foldername"
    unzip -d $foldername $i;

    cd $foldername

    for image in *.jpeg;
    do
        convert "$image" -resize 1072x1448\! "${foldername}_${image}";
        test -n "$cover" || cover="${comicbookname}/${foldername}_${image}"
        mv "${foldername}_${image}" -t ../"$comicbookname"
    done

    cd -

    rm -rf $foldername
done

zip "${comicbookname}-${appendname}".cbr "${comicbookname}"/*.jpeg

ebook-convert *.cbr .epub -vv --cover=$cover --authors="$2"

calibredb add *.epub

rm -rf "$comicbookname" *.{cbr,epub}
