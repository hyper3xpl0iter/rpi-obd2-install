#!/bin/bash

################################################################################
#
#    filename: rpi-obd2-install.sh
# description: Script to install pyOBD on RPI2/3
#      author: Andre Mattie
#       email: devel@introsec.ca
#         GPG: 5620 A200 6534 B779 08A8  B22B 0FA6 CD54 93EA 430D
#     bitcoin: 1LHsfZrES8DksJ41JAXULimLJjUZJf7Qns
#        date: 03/24/2017
#
################################################################################

# ensure script is run as root
if [ "$(id -u)" -ne "0" ] ; then
    echo "You must be root to run this script"
    exit 1
fi

# update, upgrade, and autoremove packages on system
apt-get  -y update && apt-get -y upgrade && apt-get -y autoremove

# install needed dependencies
# install python-serial
apt-get install -y python-serial
# install bluetooth packages
apt-get install -y bluetooth bluez-utils blueman
# install extra python packages
apt-get install -y python-wxgtk2.8 python-wxtools wx2.8-i18n libwxgtk2.8-dev
# install git
apt-get install -y git-core

# cd to home
cd ~

# clone pyobd git repo
git clone https://github.com/Pbartek/pyobd-pi.git

# reboot system
reboot

### How to install and startup
#
# cd ~/pyobd-pi
# python obd_gui.py
#
###
