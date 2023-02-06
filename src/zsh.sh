#!/bin/bash
set -o xtrace

sudo apt update
sudo apt install zsh -y
zsh --version
whereis zsh
sudo usermod -s /usr/bin/zsh $(whoami)
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | zsh
THEME="robbyrussell"; sed -i s/^ZSH_THEME=".\+"$/ZSH_THEME=\"$THEME\"/g ~/.zshrc

echo "
export PATH" >> ~/.zshrc