#!/bin/bash
set -o xtrace

sudo add-apt-repository universe
sudo add-apt-repository ppa:papirus/papirus
sudo apt update
sudo apt install -y gnome-tweaks
sudo apt install -y papirus-icon-theme
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'