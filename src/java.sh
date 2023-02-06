#!/bin/bash
set -o xtrace
sudo apt update

# stable version
sudo apt install -y default-jdk
# java 16
sudo apt install -y openjdk-16-jdk

# add to path the version you want to
echo "export JAVA_HOME=\"/usr/lib/jvm/java-11-openjdk-amd64/bin/\"" >> ~/.zshenv
source ~/.zshenv

# check installation
echo "current version: ${java -version}"
echo $JAVA_HOME

# switch JRE
sudo update-alternatives --config java

# switch JDK
sudo update-alternatives --config javac