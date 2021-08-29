#!/bin/bash
set -o xtrace
sudo apt update

# TOOLS
sudo apt install -y git
sudo apt install -y curl

# ZSH & OMZSH
sudo apt install -y zsh
chsh -s /usr/bin/zsh root
echo $SHELL
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
source .zshrc

# ZSH THEME
sudo apt install -y fonts-powerline
THEME="agnoster"; sed -i s/^ZSH_THEME=".\+"$/ZSH_THEME=\"$THEME\"/g ~/.zshrc

# ZSH PLUGINS
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
plugins="docker zsh-nvm docker-compose copyfile zsh-syntax-highlighting zsh-autosuggestions";
sed -i 's/\(^plugins=([^)]*\)/\1 '"$plugins"'/' .zshrc

# ZSH ALIAS
echo "
alias k=\"kubectl\"\n\
alias kgp=\"kubectl get pods\"\n\
alias kgpa=\"kubectl get pods --all-namespaces\"\n\
" >> .zshrc

# NVM
source .zshrc
nvm install --lts

# SNAPS
sudo apt install -y snapd
sudo snap install code --classic
sudo snap install discord
sudo snap install postman
sudo snap install spotify
sudo snap install telegram-desktop

# Chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt install -y google-chrome-stable

# DOCKER & COMPOSE
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl restart docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo curl -L "https://github.com/docker/compose/releases/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
rm get-docker.sh

# KUBECTL
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubectl

# TERRAFORM
sudo apt install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update && sudo apt install -y terraform

# AWS CLI V2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm awscliv2.zip
rm -rf ./aws

# EXTRAS
sudo add-apt-repository universe
sudo apt install -y gnome-tweak-tool
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
sudo add-apt-repository ppa:papirus/papirus
sudo apt install -y papirus-icon-theme
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

#reboot
