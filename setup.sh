#!/bin/bash

# Make sure we are in the users home directory
cd ~/

# Clear all the old install stuff
rm -rf ~/.arduino15
rm -rf ~/Arduino
rm -rf ./EmSys_labSetup

# Make the EmSys directory
mkdir -p ~/EmSys/

# Download arduino-cli
wget https://downloads.arduino.cc/arduino-cli/nightly/arduino-cli_nightly-latest_Linux_64bit.tar.gz
mv arduino-cli_nightly-latest_Linux_64bit.tar.gz ~/EmSys/

# unpack
cd EmSys
tar -xvf arduino-cli_nightly-latest_Linux_64bit.tar.gz
rm -rf arduino-cli_nightly-latest_Linux_64bit.tar.gz

# Make Init.ino
mkdir -p ~/EmSys/Init

echo -e "#include <ArduinoWebsockets.h>" > ~/EmSys/Init/Init.ino
echo -e "#include <WiFi.h>" >> ~/EmSys/Init/Init.ino
echo -e "const char* ssid = \"NETGEAR35\";" >> ~/EmSys/Init/Init.ino
echo -e "const char* password = \"magicalfinch482\"; " >> ~/EmSys/Init/Init.ino
echo -e "using namespace websockets; " >> ~/EmSys/Init/Init.ino
echo -e "WebsocketsClient client;" >> ~/EmSys/Init/Init.ino
echo -e "void setup() {" >> ~/EmSys/Init/Init.ino
echo -e "     WiFi.begin(ssid, password); " >> ~/EmSys/Init/Init.ino
echo -e "    for(int i = 0; i < 10 && WiFi.status() != WL_CONNECTED; i++) {" >> ~/EmSys/Init/Init.ino
echo -e "        delay(1000);" >> ~/EmSys/Init/Init.ino
echo -e "    }" >> ~/EmSys/Init/Init.ino
echo -e "    client.connect(\"ws://192.168.1.2:1234\");" >> ~/EmSys/Init/Init.ino
echo -e "    client.send(\"${USER} has configured a device\");" >> ~/EmSys/Init/Init.ino
echo -e "} " >> ~/EmSys/Init/Init.ino
echo -e "void loop() {" >> ~/EmSys/Init/Init.ino
echo -e "}" >> ~/EmSys/Init/Init.ino

echo -e "" >> ~/EmSys/Init/Init.ino

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

# Getting the ArduinoWebsockets
./arduino-cli lib install ArduinoWebsockets 

./arduino-cli compile --fqbn esp32:esp32:tinypico Init
./arduino-cli upload -p /dev/ttyUSB0 --fqbn esp32:esp32:tinypico Init 

# Append commands to the bashrc
echo -e "alias emsys_compile=\"~/EmSys/arduino-cli compile --fqbn esp32:esp32:tinypico\"" >> ~/.bashrc
echo -e "alias emsys_upload=\"~/EmSys/arduino-cli upload --fqbn esp32:esp32:tinypico\"" >> ~/.bashrc

echo "curl -o- https://raw.githubusercontent.com/STFleming/EmSys_labSetup/main/cleanup.sh | bash -" >> ~/.bashrc
