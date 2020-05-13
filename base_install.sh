#!/bin/bash

echo -n "docker|nodejs: "
read value

if [ "${value}" = "docker" ];then
    # docker install
    sudo apt-get remove docker docker-engine docker.io
    sudo apt-get update && sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
    sudo apt-get update && sudo apt-get install docker-ce
    sudo usermod -aG docker $USER
    # docker-compose install
    sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
elif [ "${value}" = "nodejs" ] ;then
    # npm install
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt install nodejs
    
fi

