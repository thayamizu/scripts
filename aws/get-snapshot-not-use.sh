#!/bin/bash
#すべてのスナップショットID
ALL_SNAPSHOTS=$(aws ec2 describe-snapshots --owner 030888287122 | jq '.Snapshots[].SnapshotId')
#AMIに紐付いているスナップショットID
AMI_SNAPSHOTS=$(aws ec2 describe-images --owner 030888287122 | jq '.Images[].BlockDeviceMappings[].Ebs.SnapshotId')
for snapshot in ${ALL_SNAPSHOTS[@]}; do
  has="No"
  for ami in ${AMI_SNAPSHOTS[@]}; do
        if [ $snapshot = $ami ]; then
          has="Yes"
          break
        fi
  done

  #突合して見つかったらYesと書き出す
  echo "$snapshot, $has"
done