#!/bin/bash
set -o xtrace

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
plugins="docker docker-compose copyfile zsh-syntax-highlighting zsh-autosuggestions";
sed -i 's/\(^plugins=([^)]*\)/\1 '"$plugins"'/' ~/.zshrc
cat ~/.zshrc | grep plugins
