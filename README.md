# EmSys setting up your lab environment  

This guide will explain how to setup your local development environment for CSC368/M68.
It will show you how to install the tools required for the lab assignments, how to configure the hardware, and how to upload and test a simple program.

The setup described here _should_ hopefully be avaialble on all the lab machines in the Computational Foundry (both windows and linux). 
However, as you are allowed to take the hardware home, this page focusses on setting up the environment from scratch on your own machine.
It will mainly consist of videos showing you want to do, and will support the following platforms:

* Windows 10
* Mac OS-X (M1)
* Ubuntu 20.04

For different Linux distributions, I will try to help you set up as best I can, but there is limited support for some of the toolchains. 


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

If you are comfortable with the command-line then I'd recommend downloading and installing ```arduino-cli``` for compilation and uploading to your TinyPico from the command line. However, these tutorials will not demonstrate this.


