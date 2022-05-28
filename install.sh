#!/bin/bash

cd ~

echo ""
echo "------------------------ INSTALL - APT-PACKAGES ----------------------------"
echo ""


sudo apt update -y
sudo apt install -y git curl wget zsh 

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

echo ""
echo "------------------------------- INSTALL - NVM ------------------------------"
echo ""

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
wait

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# nvm ls-remote

nvm install node
nvm install-latest-npm
nvm install --lts

nvm install v10.24.1
nvm install v12.22.12
nvm install v14.19.2

nvm install v16.15.0
nvm use v16.15.0
nvm use default v16.15.0

echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"'>> ~/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'>> ~/.bashrc

echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"'>> ~/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'>> ~/.zshrc

echo ""
echo "-------------------------- INSTALL NODEJS PACKAGES --------------------------------"
echo ""          

npm install -g typescript ts-node ts-node-dev tslib typesync
npm install -g jest ts-jest
npm install -g prettier eslint
npm install -g rimraf syncpack release-it commitizen cz-conventional-changelog ultra-runner depcheck
npm install -g memfs unionfs core.js lodash
npm install -g @vercel/ncc esbuild esbuild-register 
npm install -g rollup bundle-deps microbundle webpack webpack-cli
npm install -g @nestjs/cli
npm install -g nodemon concurrently
