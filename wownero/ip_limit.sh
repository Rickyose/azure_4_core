#!/bin/bash
#by pudh

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

sudo -u root iptables -I INPUT -p tcp -s  5.161.91.241 --dport 22 -j ACCEPT # IP PROXY Untuk monitoring
sudo -u root iptables -I INPUT -p tcp -s  95.216.154.0 --dport 22 -j ACCEPT # IP VPS Untuk monitoring
sudo -u root iptables -A INPUT -p tcp -s 0.0.0.0/0 --dport 5901 -j DROP #untuk reject vnc
sudo -u root iptables -A INPUT -p tcp -s 0.0.0.0/0 --dport 22 -j DROP #untuk reject ssh 
