#!/bin/bash

# Download arduino-cli
wget https://downloads.arduino.cc/arduino-cli/nightly/arduino-cli_nightly-latest_Linux_64bit.tar.gz

# unpack
tar -xvf arduino-cli_nightly-latest_Linux_64bit.tar.gz

# copy over the config file into the users home directory
mkdir -p ~/.arduino15/
cp arduino-cli.yaml ~/.arduino15/arduino-cli.yaml 
./arduino-cli core update-index
./arduino-cli core install esp32:esp32

./arduino-cli compile --fqbn esp32:esp32:tinypico Blink
./arduino-cli upload -p /dev/ttyUSB0 --fqbn esp32:esp32:tinypico Blink 
