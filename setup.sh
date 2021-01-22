#!/bin/bash

VERSION=1.8.13
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Download the Ardunio IDE
wget https://downloads.arduino.cc/arduino-${VERSION}-linux64.tar.xz ./

## extract it
tar -xvf ./arduino-${VERSION}-linux64.tar.xz  

# Adding an alias to open the arduino IDE
echo "alias arduino=${DIR}/arduino-${VERSION}/arduino" >> ~/.bashrc

# Getting PulseView  
wget https://sigrok.org/download/binary/pulseview/PulseView-0.4.2-i386.AppImage
chmod +x PulseView-0.4.2-i386.AppImage
echo "alias PulseView=${DIR}/PulseView-0.4.2-i386.AppImage" >> ~/.bashrc

pip install pyserial
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh

wget https://sigrok.org/download/binary/sigrok-firmware-fx2lafw/sigrok-firmware-fx2lafw-bin-0.1.7.tar.gz
tar -xvf sigrok-firmware-fx2lafw-bin-0.1.7.tar.gz
mkdir -p ~/.local/share/sigrok-firmware/
cp sigrok-firmware-fx2lafw-bin-0.1.7/* ~/.local/share/sigrok-firmware

echo "-----------------------------------------------------"
echo " Finished! Please log out and log back in again"
echo "-----------------------------------------------------"
