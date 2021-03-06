#!/bin/bash

# cleanup script that is automatically pulled whenever an emsys user logs in
# this can be updated and it will effect all users... so use with care
# author: stf

echo "Cleaning up..."
rm -rf ~/EmSys_labSetup
rm -rf ~/EmSys/arduino-cli_nightly-latest_Linux_64bit.tar.gz
rm -rf ~/.local/share/Trash/files/*
rm -rf ~/.cache/*
echo "Cleanup complete"

echo "Clearing any blocked ports..."
kill -9 $(ps aux | awk '/ttyUSB0/ && ! /arduino-cli/ {print $2}') &> /dev/null


echo "getting latest LetESP32.h..."
rm -rf ~/Arduino/libraries/LetESP32/LetESP32.h
mkdir -p ~/Arduino/libraries/LetESP32
wget https://raw.githubusercontent.com/STFleming/EmSys_Lab2/main/let-esp32/LetESP32.h -P ~/Arduino/libraries/LetESP32/
