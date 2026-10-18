#!/bin/bash
set -o xtrace

DISC='silviommattos@gmail.com'
KEY_PATH=~/.ssh/github_pessoal

ssh-keygen -f $KEY_PATH -t ed25519 -C $DISC
ssh-add $KEY_PATH
pbcopy < $KEY_PATH.pub
echo 'key copied to clipboard. Paste it on server...'
