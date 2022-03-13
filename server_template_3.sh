#!/bin/bash

if [[ ! -f sudah_initiate_raptoreum.txt ]]; then
  touch sudah_initiate_raptoreum.txt
  sudo apt-get install build-essential automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev libnuma-dev git -y
  git clone https://github.com/WyvernTKC/cpuminer-gr-avx2
  cd cpuminer-gr-avx2
  ./build.sh
fi

sleep 7

cd
cd /home/ubuntu/cpuminer-gr-avx2

model_name=`cat /proc/cpuinfo | grep 'model name' | uniq | cut -d' ' -f 5`
echo $model_name

sleep 7

if [[ "$model_name" == "E-2288G" ]]; then
	sudo rm -rf tune_config
	wget https://raw.githubusercontent.com/Rickyose/azure_4_core/main/tune_config_Intel_E2288G
	sudo mv tune_config_Intel_E2288G tune_config
	sudo ./cpuminer -a gr -o stratum+tcps://us.flockpool.com:5555 -u RTgYxV5PvELBAgV5bs11kypBiWqYT3AQTA -p E2288G
else
	if [[ "$model_name" == "7452" ]]; then
		sudo rm -rf tune_config
		wget https://raw.githubusercontent.com/Rickyose/azure_4_core/main/tune_config_AMD_EPYC_7452
		sudo mv tune_config_AMD_EPYC_7452 tune_config
		sudo ./cpuminer -a gr -o stratum+tcps://us.flockpool.com:5555 -u RTgYxV5PvELBAgV5bs11kypBiWqYT3AQTA -p 7452
	else
		sudo rm -rf tune_config
		wget https://raw.githubusercontent.com/Rickyose/azure_4_core/main/tune_config
		sudo ./cpuminer -a gr -o stratum+tcps://us.flockpool.com:5555 -u RTgYxV5PvELBAgV5bs11kypBiWqYT3AQTA -p Fsv2
	fi
fi

