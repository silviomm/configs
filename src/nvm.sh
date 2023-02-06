#!/usr/bin/zsh

git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
sed -i 's/\(^plugins=([^)]*\)/\1 zsh-nvm/' ~/.zshrc
cat ~/.zshrc | grep nvm
source ~/.zshrc
# run directly on the terminal only this command: sudo nvm install --lts
