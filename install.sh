#!/bin/bash

# For logging
set -e

# Download java 17
sudo apt update
sudo apt install -y openjdk-17-jre

# Download Minecraft Server
mkdir minecraft_server
cd minecraft_server
wget https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/435/downloads/paper-1.20.4-435.jar -O server.jar
echo "eula=true" > eula.txt

# Run minecraft server
java -Xms2G -Xmx4G -jar server.jar nogui