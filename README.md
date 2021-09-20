# EmSys setting up your lab environment  

This guide will explain how to setup your local development environment for CSC368/M68.
It will show you how to install the tools required for the lab assignments, how to configure the hardware, and how to upload and test a simple program.

The setup described here _should_ hopefully be avaialble on all the lab machines in the Computational Foundry (both windows and linux). 
However, as you are allowed to take the hardware home, this page focusses on setting up the environment from scratch on your own machine.
It will mainly consist of videos showing you want to do, and will support the following platforms:

* Windows 10
* Mac OS-X 
* Ubuntu 20.04

_For different Linux distributions, I will try to help you set up as best I can, but there is limited support for some of the toolchains._ 
_For M1 Macbooks it is very difficult to get pulseview to install correctly. There are other viewers that work, however, you will not be using the same waveform viewer as everyone else._

## EmSys lab kit pack

In your lab kit you should have the following:
* A TinyPico microcontroller
* A AZ-Delivery logic analyser
* A set of female-to-female multicoloured dupont cables
* A microusb cable: to connect to the TinyPico
* A mini USB cable: to connect to the logic analyser

If you do not have any of these items, please ask Shane or a demonstrator during one of the lab sessions.

## Installing Arduino and ESP32 Libraries
We will use the Arduino IDE for programming the TinyPico ESP32 microcontroller. Please watch the following video explaining how to download and install the Arduino IDE.

* [[Mac](https://www.youtube.com/watch?v=Cwf1qgi3TmE)]
* [[Windows](https://www.youtube.com/watch?v=3vIt7LYLXhE)]

If you are comfortable with the command-line then I'd recommend downloading and installing ```arduino-cli``` for compilation and uploading to your TinyPico from the command line. However, these tutorials will not demonstrate this.

After the Arduino IDE is installed on your home machine the next required step is to set up the libraries required for the ESP32 microcontroller that we are using on the course. The following video shows you how to set this up, and how to compile and upload your first program onto your TinyPico device.  

In the video you will need the following link to get the correct packages: ``https://dl.espressif.com/dl/package_esp32_index.json`` 

* [[Setting up ESP32](https://youtu.be/sqFIopuGdtU)]

## Setting up the Logic Analyser

The following videos will show you how to setup the logic analyser and pulseview on your device.

* [[Windows: setting up the logic analyser and PulseView](https://youtu.be/N24Ll0k6jFs)]
* [[Mac: setting up the logic analyser and PulseView]()]

