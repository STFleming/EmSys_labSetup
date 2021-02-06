#!/bin/bash

# Clear all the old install stuff
rm -rf ~/.arduino15
rm -rf ~/Arduino
rm -rf ./EmSys_LabSetup

# Make the EmSys directory
mkdir -p ~/EmSys/

# 

# Download arduino-cli
wget https://downloads.arduino.cc/arduino-cli/nightly/arduino-cli_nightly-latest_Linux_64bit.tar.gz
mv arduino-cli_nightly-latest_Linux_64bit.tar.gz ~/EmSys/

# unpack
cd EmSys
tar -xvf arduino-cli_nightly-latest_Linux_64bit.tar.gz

# Make Blink.ino
mkdir -p ~/EmSys/Blink

echo -e "const int pin = 14;" > ~/EmSys/Blink/Blink.ino
echo -e "void setup() {" > ~/EmSys/Blink/Blink.ino
echo -e " pinMode(pin, OUTPUT); " > ~/EmSys/Blink/Blink.ino
echo -e "} " > ~/EmSys/Blink/Blink.ino
echo -e "void loop() {" > ~/EmSys/Blink/Blink.ino
echo -e " digitalWrite(pin, HIGH);" > ~/EmSys/Blink/Blink.ino
echo -e " delay(1000);" > ~/EmSys/Blink/Blink.ino
echo -e " digitalWrite(pin, LOW);" > ~/EmSys/Blink/Blink.ino
echo -e " delay(1000);" > ~/EmSys/Blink/Blink.ino
echo -e "}" > ~/EmSys/Blink/Blink.ino

# copy over the config file into the users home directory
mkdir -p ~/.arduino15/

# Generate a YAML file with the ESP32 board stuff
echo -e "board_manager:" > arduino-cli.yaml
echo -e "    additional_urls: [https://raw.githubusercontent.com/espressif/arduino-esp32/gh-pages/package_esp32_index.json]" >> arduino-cli.yaml
echo -e "daemon:" >> arduino-cli.yaml
echo -e "    port: \"50051\"" >> arduino-cli.yaml
echo -e "directories:" >> arduino-cli.yaml
echo -e "    data: $HOME/.arduino15" >> arduino-cli.yaml
echo -e "    downloads: $HOME/.arduino15/staging" >> arduino-cli.yaml
echo -e "    user: $HOME/Arduino" >> arduino-cli.yaml
echo -e "library:" >> arduino-cli.yaml
echo -e "    enable_unsafe_install: false" >> arduino-cli.yaml
echo -e "logging:" >> arduino-cli.yaml
echo -e "    file: \"\"" >> arduino-cli.yaml
echo -e "    format: text" >> arduino-cli.yaml
echo -e "    level: info" >> arduino-cli.yaml
echo -e "metrics:" >> arduino-cli.yaml
echo -e "    addr: 9090" >> arduino-cli.yaml
echo -e "    enabled: true" >> arduino-cli.yaml
echo -e "sketch:" >> arduino-cli.yaml
echo -e "    always_export_binaries: false" >> arduino-cli.yaml

cp arduino-cli.yaml ~/.arduino15/arduino-cli.yaml 
./arduino-cli core update-index
./arduino-cli core install esp32:esp32

./arduino-cli compile --fqbn esp32:esp32:tinypico Blink
./arduino-cli upload -p /dev/ttyUSB0 --fqbn esp32:esp32:tinypico Blink 
