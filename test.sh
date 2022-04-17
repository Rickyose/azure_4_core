#!/bin/bash

sudo apt install sysstat -y
sudo apt install stress -y
sudo apt install curl -y
stress --cpu 1 &
sleep 10
