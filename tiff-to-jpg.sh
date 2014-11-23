#!/usr/bin/env bash
# tiff-to-jpg.sh by Amory Meltzer
# Easily bastch-convert tiff files to jpegs
# Just a simple wrapper around imagemagick's mogrify:
# http://www.imagemagick.org/script/convert.php

if [ $1 ]; then
    mogpath=$1
    echo $mogpath
else
    echo "Please specify a directory"
    fi
