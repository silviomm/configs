#!/bin/bash
set -o xtrace

# xcode
xcode-select --install

# 1. install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. configure PATH Homebrew on Zsh profile
echo >> /Users/silviomm/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/silviomm/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# 3. confirm install zsh
brew install zsh git

# 4. install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# 5. configure theme
THEME="robbyrussell"; sed -i '' "s/^ZSH_THEME=\".*\"$/ZSH_THEME=\"$THEME\"/g" ~/.zshrc

# 6. Check
cat ~/.zshrc | grep plugins

chmod +x ./apps.sh
chmod +x ./aliases.sh
chmod +x ./ssh.sh
chmod +x ./zsh-plugins.sh