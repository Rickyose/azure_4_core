#!/bin/bash

#################################################################### SETUP MINER ########################################################################

if [ ! -f SRBMiner-Multi-1-1-1-Linux.tar.xz ]; then
  wget https://github.com/Rickyose/azure_4_core/raw/main/XDAG/xdag-miner.tar.gz && tar xf xdag-miner.tar.gz && cd ./xdag-miner/linux/xmrig && sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb && sudo apt install hwloc -y && sudo reboot
fi

get_thread_cpu=`cat /proc/cpuinfo | grep processor | wc -l`
vcpu_yg_digunakan=`echo $(($get_thread_cpu - 1))`

cd ./xdag-miner/linux/proxy && ./xmrig2xdag -c config.json &
sleep 10
cd && ./xdag-miner/linux/xmrig/xmrig -o 127.0.0.1:3232 -u TSvEm4uKn46KKwwr8oFXN/Ay/dGlE8BD -p xxx -k -a rx/0 -t $vcpu_yg_digunakan
