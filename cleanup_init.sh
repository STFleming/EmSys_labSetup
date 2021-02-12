#!/bin/bash

# sets up the cleanup script which is pulled from the git repo fresh every bash login

echo "curl -o- https://raw.githubusercontent.com/STFleming/EmSys_labSetup/main/cleanup.sh | bash -" >> ~/.bashrc
