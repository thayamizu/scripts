#!/bin/sh
git branch --merged | egrep -v '\*|develop|master' | xargs git branch -d
