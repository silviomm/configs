#!/bin/bash
set -o xtrace

DISC='silviommattos@gmail.com'
KEY_PATH=~/.ssh/github_pessoal

ssh-keygen -f $KEY_PATH -t ed25519 -C $DISC
ssh-add $KEY_PATH
sudo apt update
sudo apt install xclip
xclip -selection clipboard < $KEY_PATH.pub
echo 'key copied to clipboard. Paste on server...'