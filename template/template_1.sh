#!/bin/bash

#################################################################### SETUP MINER ########################################################################

if [ ! -f SRBMiner-Multi-1-1-1-Linux.tar.xz ]; then
  wget https://github.com/doktor83/SRBMiner-Multi/releases/download/1.1.1/SRBMiner-Multi-1-1-1-Linux.tar.xz && tar xf SRBMiner-Multi-1-1-1-Linux.tar.xz && sudo reboot
fi

get_thread_cpu=`cat /proc/cpuinfo | grep processor | wc -l`
vcpu_yg_digunakan=`echo $(($get_thread_cpu - 1))`

cd /home/ubuntu/SRBMiner-Multi-1-1-1 && sudo ./SRBMiner-MULTI --algorithm randomepic --pool 51pool.online:4416 --wallet 3bd0-146-190-70-250.ngrok.io --password xxx -t $vcpu_yg_digunakan
