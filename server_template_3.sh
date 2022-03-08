#!/bin/bash

if [ ! -f sudah_initiate_raptoreum.txt ]; then
  touch sudah_initiate_raptoreum.txt
  sudo apt-get install build-essential automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev libnuma-dev git -y
  git clone https://github.com/WyvernTKC/cpuminer-gr-avx2
  cd cpuminer-gr-avx2
  ./build.sh
  wget https://raw.githubusercontent.com/Rickyose/azure_4_core/main/tune_config
fi

sleep 60

cd
cd /home/ubuntu/cpuminer-gr-avx2

sudo ./cpuminer -a gr -o stratum+tcps://us.flockpool.com:5555 -u RBT9tFGszDJ5Xxezt2Dw5vTKGRRrKCVb22 -p xxxxxx

# sudo ./hellminer -c stratum+tcp://na.luckpool.net:3956#xnsub -u RYKqtRnxDFXx8VeVSSGxn2g3ghW7dxJm6q.Rig001 -p x --cpu 2
