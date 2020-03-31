#/bin/bash
# check arguments
if [ $# -ne 1 ]; then
    echo "invalid arguments."
    exit -1
fi

STACK_NAME=$1
STACKS=`aws cloudformation describe-stacks \
      --stack-name $1 | jq ".Stacks[].Outputs[].OutputValue"`
for stack  in ${STACKS[@]}; do
    echo $stack
done


