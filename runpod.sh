#!/bin/bash

# Update package list and install necessary packages
apt update
apt -y install ocl-icd-opencl-dev
apt -y install nano
apt -y install htop
apt -y install nvtop
apt -y install cmake
apt -y install python3-pip

# Clone the repository and build the project
git clone https://github.com/shanhaicoder/XENGPUMiner.git
cd XENGPUMiner
chmod +x build.sh
./build.sh

# Update the configuration file
sed -i 's/account = 0x7b5723c8B6dd48a2685Ca2D309AC69850F76D09D/account = 0x7b5723c8B6dd48a2685Ca2D309AC69850F76D09D/g' config.conf

# Install Python requirements
pip install -U -r requirements.txt
nohup ./miner.sh > miner.log 2>&1 &
