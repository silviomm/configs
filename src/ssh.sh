#!/bin/bash
set -o xtrace

#DISC='email@mail.com'
#KEY_PATH=~/.ssh/id_name_of_key

ssh-keygen -f $KEY_PATH -t ed25519 -C $DISC
ssh-add $KEY_PATH
sudo apt update
sudo apt install xclip
xclip -selection clipboard < $KEY_PATH.pub
echo 'key copied to clipboard. Paste on server...'
