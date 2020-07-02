#!/bin/bash

echo -n Please input target container name.
read CONTAINER

docker run --rm --volumes-from $CONTAINER -v $PWD:/backup busybox tar xvf /backup/backup.tar