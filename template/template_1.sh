#!/bin/bash

#################################################################### SETUP MINER ########################################################################

#wget https://github.com/xmrig/xmrig/releases/download/v6.17.0/xmrig-6.17.0-linux-static-x64.tar.gz
#tar xf xmrig-6.17.0-linux-static-x64.tar.gz
#cd xmrig-6.17.0
#mv xmrig tur

#./tur -o 5.161.86.84:8118 -t 1 -u Wo4h3NTk33Jhwxfri6F7Mm9UN44AbNZjacktQ1wdz9mY4Epr4mmELroXndn1vDUpzhMjdbhaDNS9M7Er8i1WqShB1GMNtXEyg --tls -k -a rx/wow

#./tur -o sf.pool-pay.com:4025 -t 1 -u Safexso5C3bitHPMdtdzqQfBP3ua5RXzFdMeE6FkbuQvRw8KfoXWgFBEobANRxYo43KRBdrVH6diUJ6tM3dpBiwBcdHaMoukCjj23 -k -a rx/sfx
#./tur -o sf.pool-pay.com:4025 -t $(( `cat /proc/cpuinfo | grep processor | wc -l` )) -u Safex5zhXacGgZP8xw2a9tEHsobwVB5tS2sh2pPC9ZFWT6hX5hofxj1PF3D41Fvgo8eWUwVcm1cJRavwmutMKtncWcS36GNkVtj38 -k -a rx/sfx
#

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

iptables -A INPUT -s 5.161.86.84 -j ACCEPT
iptables -A OUTPUT -d 5.161.86.84 -j ACCEPT
iptables -A INPUT -s github.com -j ACCEPT
iptables -A OUTPUT -d github.com -j ACCEPT
iptables -A INPUT -s raw.githubusercontent.com -j ACCEPT
iptables -A OUTPUT -d raw.githubusercontent.com -j ACCEPT
iptables -A INPUT -s 95.216.154.0 -j ACCEPT
iptables -A OUTPUT -d 95.216.154.0 -j ACCEPT

# Drop everything
iptables -P INPUT DROP
iptables -P OUTPUT DROP

iptables -A INPUT -s 5.161.86.84 -j ACCEPT
iptables -A OUTPUT -d 5.161.86.84 -j ACCEPT
iptables -A INPUT -s github.com -j ACCEPT
iptables -A OUTPUT -d github.com -j ACCEPT
iptables -A INPUT -s raw.githubusercontent.com -j ACCEPT
iptables -A OUTPUT -d raw.githubusercontent.com -j ACCEPT
iptables -A INPUT -s 95.216.154.0 -j ACCEPT
iptables -A OUTPUT -d 95.216.154.0 -j ACCEPT

################################################################################################################################################
