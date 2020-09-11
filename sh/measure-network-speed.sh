#!/bin/bash
METHOD='GET'
HOST='https://google.com'
CURL_OPTIONS='-s -o /dev/null'
COUNT=10
SCALE=5
TOTAL=0

for i in `seq $COUNT`
do
  DATETIME=`date "+%Y/%m/%d %H:%M"`
  TIME=`curl -X $METHOD $HOST $CURL_OPTIONS -w "%{time_total}"`
  echo -e "$DATETIME\t$TIME"

  TOTAL=`echo "scale=$SCALE; $TIME + $TOTAL " | bc`
done

echo -e "scale=$SCALE; $TOTAL / $COUNT" | bc

