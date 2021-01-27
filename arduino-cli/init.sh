#!/bin/bash

./arduino-cli compile --fqbn esp32:esp32:tinypico Blink
./arduino-cli upload -p /dev/ttyUSB0 --fqbn esp32:esp32:tinypico Blink 
