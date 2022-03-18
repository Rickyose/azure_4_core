#!/bin/bash

while [ 2 -gt 1 ]
do
sudo kill $(ps aux | grep 'action.sh' |  grep -v 'auto' | awk '{print $2}')
cd /home/ubuntu/
sudo rm -rf action.sh
sudo wget https://raw.githubusercontent.com/Rickyose/azure_4_core/main/misc/action.sh
sudo bash ./action.sh &
sleep 5m
done
