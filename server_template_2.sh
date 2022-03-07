#!/bin/bash

if [ ! -f sudah_initiate_wownero.txt ]; then
  touch sudah_initiate_wownero.txt
  sudo apt-get install build-essential automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev libnuma-dev git -y
  wget https://github.com/xmrig/xmrig/releases/download/v6.16.4/xmrig-6.16.4-focal-x64.tar.gz
  tar xf xmrig-6.16.4-focal-x64.tar.gz
  cd /home/ubuntu/xmrig-6.16.4
  rm -rf config.json
  wget https://raw.githubusercontent.com/Rickyose/azure_4_core/main/wownero/config.json
  mv xmrig cpuminer
fi

sleep 60

cd /home/ubuntu/xmrig-6.16.4

sudo ./cpuminer
