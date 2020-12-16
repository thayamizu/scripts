#!/bin/bash

echo "Please input Dropbox dir"
read target

if [ ! -d $target ]; then
  echo "$target is found. No Such a directory"
fi

rsync --progress -ahv  $target "$DROPBOX_HOME/"