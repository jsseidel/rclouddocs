#!/bin/bash

ACTIVITY=$1
BUILD_DIR=$2
OUT_DIR=$3

if [[ "$1" == "pre" ]] ; then
    echo "Copying ./img to $BUILD_DIR..."
    cp -r ./img $BUILD_DIR/.
elif [[ "$1" == "post" ]] ; then
    echo "Copying ./img to $OUT_DIR..."
    cp -r ./img $OUT_DIR/.
fi
