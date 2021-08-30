#!/bin/bash
echo "ID, Name, AttachedNetworkIF, AttachedAutoScalingGroup"
SECG=`aws ec2 describe-security-groups \
          --query 'SecurityGroups[].[join(\`,\`,[GroupId,GroupName])]' \
          --output text`
for sg in ${SECG[@]}; do
  fields=$(echo $sg | awk -F ',' '{print NF}')
  if [ $fields -ne  2 ]; then
    continue
  fi

  sg_id=$(echo ${sg} | cut -d ',' -f1)
  sg_name=$(echo ${sg} | cut -d ',' -f2)
   
  echo -n "${sg}"
 
  # このSGを使用しているNIFがあるか問合せ
  NIF=$(aws ec2 describe-network-interfaces \
       --filters Name=group-id,Values=${sg_id} \
       --query 'NetworkInterfaces[]' \
       --output text)
  if [ -n "${NIF}" ]; then
    echo -n ",Yes"
  else
    echo -n ",No"
  fi
   
  # このSGを使用している起動設定があるか問合せ
  AS=$(aws autoscaling describe-launch-configurations \
          --query "LaunchConfigurations[?contains(SecurityGroups,\`${sg_id}\`)].[LaunchConfigurationName]" \
          --output text)
  if [ -n "${AS}" ]; then
    echo -n ",Yes"
  else
    echo -n ",No"
  fi
   
  echo ;
done
