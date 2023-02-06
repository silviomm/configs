#!/bin/bash
set -o xtrace

echo 'total swap: '
grep SwapTotal /proc/meminfo
sudo swapoff -a
sudo dd if=/dev/zero of=/swapfile bs=1G count=8
sudo mkswap /swapfile
sudo swapon /swapfile
echo 'total swap now: '
grep SwapTotal /proc/meminfo

