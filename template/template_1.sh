#!/bin/bash

#################################################################### SETUP MINER ########################################################################

if [ ! -f linux_proxy_v1.1.4+rig_no_fee_v6.18.0 ]; then
  sudo apt install unzip && wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb && sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb && sudo apt install hwloc -y && wget https://github.com/XDagger/xmrig2xdag/releases/download/v1.1.4/linux_proxy_v1.1.4+rig_no_fee_v6.18.0.zip && unzip linux_proxy_v1.1.4+rig_no_fee_v6.18.0.zip && sudo reboot
fi

get_thread_cpu=`cat /proc/cpuinfo | grep processor | wc -l`
vcpu_yg_digunakan=`echo $(($get_thread_cpu - 1))`

cd && cd ./linux_proxy_v1.1.4+rig_no_fee_v6.18.0/linux/proxy && ./xmrig2xdag -c config.json &
cd && ./linux_proxy_v1.1.4+rig_no_fee_v6.18.0/linux/xmrig/xmrig -o 127.0.0.1:3232 -u TSvEm4uKn46KKwwr8oFXN/Ay/dGlE8BD -p xxx -k -a rx/0 -t $vcpu_yg_digunakan
