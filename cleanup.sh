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
