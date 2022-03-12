#!/bin/bash

if [ ! -f sudah_initiate_raptoreum.txt ]; then
  touch sudah_initiate_raptoreum.txt
  sudo apt-get install build-essential automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev libnuma-dev git -y
  git clone https://github.com/WyvernTKC/cpuminer-gr-avx2
  cd cpuminer-gr-avx2
  ./build.sh
fi

sleep 7

cd
cd /home/ubuntu/cpuminer-gr-avx2

if [ ! -f sudah_initiate_tune_full.txt ]; then
	sudo rm -rf tune_config
	touch sudah_initiate_tune_full.txt
	sudo ./cpuminer -a gr -o stratum+tcps://us.flockpool.com:5555 -u RTgYxV5PvELBAgV5bs11kypBiWqYT3AQTA -p xxxxxx --tune-full
else
	sudo ./cpuminer -a gr -o stratum+tcps://us.flockpool.com:5555 -u RTgYxV5PvELBAgV5bs11kypBiWqYT3AQTA -p xxxxxx
fi
