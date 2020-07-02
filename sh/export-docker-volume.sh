#!/bin/bash

echo -n Please input target container name.
read CONTAINER

echo -n Please input backup target path.
read TARGET

docker run --rm --volumes-from $CONTAINER -v $PWD:/backup busybox tar cvf /backup/backup.tar $TARGET