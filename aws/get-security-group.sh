#/bin/bash
declare -a SECG=$(aws ec2 describe-security-groups | jq '.SecurityGroups[].GroupName')
for secg in ${SECG[@]}; do
  echo "SecurityGroupName: "$secg" "
  INSTANCES=$(aws ec2 describe-instances | jq -r '.Reservations[].Instances[] | select(.SecurityGroups[].GroupName=='$secg') | [.InstanceId, .Tags[].Value] | @csv')
  for instance in ${INSTANCES[@]}; do 
    echo  "   $instance" 
  done
  echo "-----"
done
