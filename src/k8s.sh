#!/bin/bash
set -o xtrace

# kubectl
# sudo apt install -y ca-certificates curl
# sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
# echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
# sudo apt update
# sudo apt install -y kubectl
# sed -i 's/\(^plugins=([^)]*\)/\1 kubectl/' ~/.zshrc
# kubectl version --client

# telepresence
# sudo curl -fL https://app.getambassador.io/download/tel2/linux/amd64/latest/telepresence -o /usr/local/bin/telepresence
# sudo chmod a+x /usr/local/bin/telepresence
echo "
alias tel=\"telepresence\"" >> ~/.zshrc

# todo
# add krew, stern