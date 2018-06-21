#!/bin/bash

echo " --- AWS Containerized Applications Development Ambient --- "

echo "Updating Packages..."

sudo apt-get update 

echo "Installing basic Packages..."

sudo apt-get install apt-transport-https ca-certificates curl software-properties-common --assume-yes --force-yes

echo "Getting Docker Packages..."

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo "Updating Packages..."

sudo apt-get update

echo "Installing Docker Community Edition Version 18.03.1..."

sudo apt-get install docker-ce=18.03.1~ce-0~ubuntu --assume-yes --force-yes

echo "Docker Community Edition Installed!"

echo "Installing Docker Compose 1.21.2..."

sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Docker Compose Installed!"

echo "Getting Python3.6 Packages..."

sudo add-apt-repository ppa:jonathonf/python-3.6

echo "Updating Packages..."

sudo apt-get update

echo "Installing Python3.6..."

sudo apt-get install python3.6 --assume-yes --force-yes

echo "Python3.6 Installed..."

echo "Installing Python3.6-pip"

wget https://bootstrap.pypa.io/get-pip.py
sudo python3.6 get-pip.py

echo "Python3.6-pip Installed!"

echo "Installing Last Version Of AWS CLI..."

pip install awscli --upgrade --user

echo "AWS CLI Installed!"

echo "Installing Last Version Of ECS CLI..."

sudo curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-95406b1
sudo chmod +x /usr/local/bin/ecs-cli

echo "ECS CLI Installed!"

sudo usermod -a -G docker $USER

echo "[ OK ] Vagrant Setup Finished"
