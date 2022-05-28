#!/bin/bash

cd ~

sudo apt update -y
sudo apt install -y git curl wget zsh 

echo ""
echo "------------------------ INSTALL - APT-PACKAGES ----------------------------"
echo ""

sudo apt install -y htop tar nano net-tools build-essential zsh zsh-antigen fonts-powerline
sudo apt install -y apt-transport-https ca-certificates software-properties-common sqlite gparted


sudo chsh -s $(which zsh)

echo ""
echo "------------------------------- INSTALL OH-MY-ZSH ---------------------------------"
echo ""          

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

