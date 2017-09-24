#!/bin/bash


##########################
## Start on boot Script ##
##########################

start() {
  echo "Starting ssh server..."
  systemctl start sshd
  sleep 1
  echo "Done!"
  echo
  echo "Displaying ip address..."
  ip addr | grep 192.168.*
  sleep 1
  echo "Done!"
  echo
  read -p "Autorun install.sh script? (y/n):  " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
      echo
      reboot
    else
      echo
      echo "Starting install.sh script..."
      mount -o remount,size=2G /run/archiso/cowspace
      #wget https://raw.githubusercontent.com/Pheoxy/linux_install_scripts/master/install/archlinux/install.sh
      wget pheoxy.com/archlinux/install.sh
      chmod +x install.sh
      ./install.sh
      # pacman -Sy git
      # y
      # git clone git://github.com/Pheoxy/linux_install_scripts
      # cd linux_install_scripts/
      #chmod +x ./install/archlinux/install.sh
      # ./install/archlinux/install.sh
  fi
}

reboot() {
  read -p "Reboot? (y/n):  " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
      printf 'Done!\n'
      exit 0
    else
      echo
      echo "Rebooting..."
      sleep 3
      #reboot
  fi
}

start

exit 0
