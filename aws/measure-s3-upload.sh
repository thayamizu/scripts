#!/bin/bash
END_POINT='https://xxxx.amazonaws.com'
METHOD='PUT'
CURL_OPTIONS='-s -T'
FILE_LIST=("250M" "500M" "750M" "1G")
EXT=".txt"
COUNT=10
TOTAL=0
SCALE=5

#S3 Upload
for file in "${FILE_LIST[@]}"; do
  echo $END_POINT/$file$EXT
  TOTAL=0
  for count  in `seq -w $COUNT`; do
    DATETIME=`date "+%Y/%m/%d %H:%M"`
    TIME=`curl -X $METHOD $END_POINT/${file}-$count$EXT $CURL_OPTIONS ./$file$EXT -w "%{time_total}"`
    echo -e "$DATETIME\t$TIME"

    TOTAL=`echo "scale=$SCALE; $TIME + $TOTAL " | bc`
  done
  echo -e "scale=$SCALE; $TOTAL / $COUNT" | bc
done


