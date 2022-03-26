#!/bin/bash

sleep 5

#sudo rm -rf touch sudah_reboot_1x.txt

if [[ ! -f sudah_reboot_1x.txt ]]; then
  touch sudah_reboot_1x.txt
  sudo reboot
fi
