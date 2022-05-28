#!/bin/bash

cd ~

sudo apt update -y
sudo apt install -y git curl wget zsh 

echo ""
echo "------------------------ INSTALL - APT-PACKAGES ----------------------------"
echo ""

sudo apt install -y htop tar nano net-tools build-essential zsh zsh-antigen fonts-powerline
sudo apt install -y apt-transport-https ca-certificates software-properties-common sqlite gparted


echo ""
echo "------------------------------- INSTALL OH-MY-ZSH ---------------------------------"
echo ""          

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

curl -L git.io/antigen > antigen.zsh
source antigen.zsh

antigen init 
antigen bundle git
antigen bundle pip
antigen bundle python
antigen bundle command-not-found
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme spaceship-prompt/spaceship-prompt
antigen apply

zsh
