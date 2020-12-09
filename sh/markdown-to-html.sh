#!/bin/bash
PRE_IFS=$IFS
IFS=$'\n'
WORKDIR=$(pwd)

echo "please input target filename:"
read -e target

mdfile=`find $WORKDIR -name $target -print0 | xargs -0 ls`
for file in $mdfile
do
    echo $file
    name=`basename $file .md`
    `pandoc -s -f markdown -t html $file -o $name.html`
done

IFS=$PRE_IFS