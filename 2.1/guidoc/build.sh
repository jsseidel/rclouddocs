#!/bin/bash

ACTIVITY=$1
OUT_DIR=$2

if [[ "$ACTIVITY" == "pre" ]] ; then
    echo "NOP"
elif [[ "$ACTIVITY" == "post" ]] ; then
    echo "Publishing to /var/www/html"
    sudo cp -r ./$OUT_DIR/* /var/www/html/rcloud/.
    ls -l /var/www/html/rcloud
fi
