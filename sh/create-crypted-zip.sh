#!/bin/bash
if [ ! -d $1 ]; then
    echo "invalid argment.Please input directory path"
    exit -1
fi
zip -r -e $1.zip $1
