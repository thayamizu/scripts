#!/bin/bash
for ((i=0 ; i<255 ; i++))
do
IP="192.168.2.$i"
smbutil -v status -ae $IP
done
