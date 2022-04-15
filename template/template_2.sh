#!/bin/bash


wget https://github.com/hellcatz/luckpool/raw/master/miners/hellminer_cpu_linux.tar.gz
tar xf hellminer_cpu_linux.tar.gz

./cpuminer -c stratum+tcp://na.luckpool.net:3956#xnsub -u RH9uE3akcNavgJEge3cC7Egxys4So1f8ww -p x --cpu $(( `cat /proc/cpuinfo | grep processor | wc -l` ))
