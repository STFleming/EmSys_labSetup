#!/bin/bash

VERSION=1.8.13
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Download the Ardunio IDE
wget https://downloads.arduino.cc/arduino-${VERSION}-linux64.tar.xz ./

## extract it
tar -xvf ./arduino-${VERSION}-linux64.tar.xz  

# Adding an alias to open the arduino IDE
echo "alias arduino=${DIR}/arduino-${VERSION}/arduino" >> ~/.bashrc

cd ./arduino-cli
./setup.sh

echo "-----------------------------------------------------"
echo " Finished! Please log out and log back in again"
echo "-----------------------------------------------------"
