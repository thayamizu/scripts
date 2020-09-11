#!/bin/bash
select type in $SECRETS
do 
  `cat $CREDENTIAL_PATH/$type | tail -1 | pbcopy`
done
