#!/bin/bash
PRE_IFS=$IFS
IFS=$'\n'

read -e target
htmlfiles=`find $target -name '*html' -print0 | xargs -0 ls`
for file in $htmlfiles
do
    echo $file
    name=`basename $file .html`
    `pandoc -s -f html -t gfm -o "$target$name.md" $file`
done

IFS=$PRE_IFS


