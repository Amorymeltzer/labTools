#!/usr/bin/env bash
# tiff-to-jpg.sh by Amory Meltzer
# Easily bastch-convert tiff files to jpegs
# Just a simple wrapper around imagemagick's mogrify:
# http://www.imagemagick.org/script/convert.php
# Could use https://tinypng.com/developers/reference but too slow

if [ $1 ]; then
    mogpath=$1
else
    echo "Please specify a directory"
    exit;
fi

mogrify -format jpg $mogpath/*.tif

rm $mogpath/*.tif
