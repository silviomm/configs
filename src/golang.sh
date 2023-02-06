#!/bin/bash
set -o xtrace

rm -rf /usr/local/go
wget https://golang.org/dl/go1.19.5.linux-amd64.tar.gz
sudo tar -xf go1.19.5.linux-amd64.tar.gz -C /usr/local
rm go1.19.5.linux-amd64.tar.gz
echo "
path+=('/usr/local/go/bin')" >> ~/.zshrc

# packages
sudo apt install hugo