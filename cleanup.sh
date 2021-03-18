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
wget https://raw.githubusercontent.com/STFleming/EmSys_Lab3/main/libs/LetESP32/LetESP32.h -P ~/Arduino/libraries/LetESP32/

# Installing the DallasTemperature Library
mkdir -p ~/Arduino/libraries/DallasTemperature
if [ ! -f "~/Arduino/libraries/DallasTemperature/DallasTemperature.cpp" ]; then
        wget https://raw.githubusercontent.com/STFleming/EmSys_Lab3/main/libs/DallasTemperature/DallasTemperature.cpp -P ~/Arduino/libraries/DallasTemperature/
fi

if [ ! -f "~/Arduino/libraries/DallasTemperature/DallasTemperature.h" ]; then
        wget https://raw.githubusercontent.com/STFleming/EmSys_Lab3/main/libs/DallasTemperature/DallasTemperature.h -P ~/Arduino/libraries/DallasTemperature/
fi

if [ ! -f "~/Arduino/libraries/DallasTemperature/README.md" ]; then
        wget https://raw.githubusercontent.com/STFleming/EmSys_Lab3/main/libs/DallasTemperature/README.md -P ~/Arduino/libraries/DallasTemperature/
fi

if [ ! -f "~/Arduino/libraries/DallasTemperature/keyword.txt" ]; then
        wget https://raw.githubusercontent.com/STFleming/EmSys_Lab3/main/libs/DallasTemperature/keyword.txt -P ~/Arduino/libraries/DallasTemperature/
fi

if [ ! -f "~/Arduino/libraries/DallasTemperature/library.json" ]; then
        wget https://raw.githubusercontent.com/STFleming/EmSys_Lab3/main/libs/DallasTemperature/library.json -P ~/Arduino/libraries/DallasTemperature/
fi

if [ ! -f "~/Arduino/libraries/DallasTemperature/library.properties" ]; then
        wget https://raw.githubusercontent.com/STFleming/EmSys_Lab3/main/libs/DallasTemperature/library.properties -P ~/Arduino/libraries/DallasTemperature/
fi

# Installing the OneWire library
mkdir -p ~/Arduino/libraries/OneWire
mkdir -p ~/Arduino/libraries/OneWire/util
if [ ! -f "~/Arduino/libraries/OneWire/util/OneWire_direct_gpio.h" ]; then
        wget https://raw.githubusercontent.com/STFleming/EmSys_Lab3/main/libs/OneWire/util/OneWire_direct_gpio.h -P ~/Arduino/libraries/OneWire/util/
fi

if [ ! -f "~/Arduino/libraries/OneWire/util/OneWire_direct_regtype.h" ]; then
        wget https://raw.githubusercontent.com/STFleming/EmSys_Lab3/main/libs/OneWire/util/OneWire_direct_regtype.h -P ~/Arduino/libraries/OneWire/util/
fi

if [ ! -f "~/Arduino/libraries/OneWire/OneWire.cpp" ]; then
        wget https://raw.githubusercontent.com/STFleming/EmSys_Lab3/main/libs/OneWire/OneWire.cpp -P ~/Arduino/libraries/OneWire/
fi

if [ ! -f "~/Arduino/libraries/OneWire/OneWire.h" ]; then
        wget https://raw.githubusercontent.com/STFleming/EmSys_Lab3/main/libs/OneWire/OneWire.h -P ~/Arduino/libraries/OneWire/
fi

if [ ! -f "~/Arduino/libraries/OneWire/keywords.txt" ]; then
        wget https://raw.githubusercontent.com/STFleming/EmSys_Lab3/main/libs/OneWire/keywords.txt -P ~/Arduino/libraries/OneWire/
fi

if [ ! -f "~/Arduino/libraries/OneWire/library.json" ]; then
        wget https://raw.githubusercontent.com/STFleming/EmSys_Lab3/main/libs/OneWire/library.json -P ~/Arduino/libraries/OneWire/
fi

if [ ! -f "~/Arduino/libraries/OneWire/library.properties" ]; then
        wget https://raw.githubusercontent.com/STFleming/EmSys_Lab3/main/libs/OneWire/library.properties -P ~/Arduino/libraries/OneWire/
fi
