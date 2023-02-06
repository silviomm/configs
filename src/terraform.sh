#!/bin/bash
set -o xtrace

sudo apt install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update && sudo apt install -y terraform
git clone https://github.com/macunha1/zsh-terraform ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/terraform
sed -i 's/\(^plugins=([^)]*\)/\1 terraform/' ~/.zshrc