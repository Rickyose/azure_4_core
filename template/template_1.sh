#!/bin/bash

#################################################################### SETUP MINER ########################################################################

if [ ! -f SRBMiner-Multi-2-2-3 ]; then
  wget https://github.com/doktor83/SRBMiner-Multi/releases/download/2.2.3/SRBMiner-Multi-2-2-3-Linux.tar.xz
  tar xf SRBMiner-Multi-2-2-3-Linux.tar.xz
fi

sudo sysctl -w vm.nr_hugepages=1280
cd SRBMiner-Multi-2-2-3
./SRBMiner-MULTI --algorithm randomepic\;minotaurx\;minotaurx --pool 51pool.online:4416\;fastpool.xyz:6131\;fastpool.xyz:6011 --wallet abertdune\;solo:PXg4iHiaREtHutKZE7d3pFWvgxeBYiCWRu\;solo:MD4Naqnebo18yrNpEnXPvLKiZWSYj6VZcz --password Aa88888888\;x\;x --cpu-threads 0\;0\;0 --disable-gpu 

while [ 2 > 1 ]
do
   sudo apt-get install sysstat
   while [ `vmstat 1 2 | awk 'FNR>3{print $(NF-4)}'` > 90 ]
   do
   command1
   command2
   command3
done
