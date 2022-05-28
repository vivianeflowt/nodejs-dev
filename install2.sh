#!/bin/bash

cd ~

zsh

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
echo "------------------------------- UBUNTU -----------------------------------"
echo ""  

sudo apt install -y --install-recommends flatpak snapd

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -f -y ./google-chrome-stable_current_amd64.deb
rm -rf google-chrome-stable_current_amd64.deb


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
apt-cache policy docker-ce
sleep 10
sudo apt install -y docker-ce

sudo snap install postman
sudo snap install heroku --classic
sudo snap install insomnia-designer
sudo snap install postbird
sudo snap install postman --classic
sudo snap install vlc --classic
sudo snap install code --classic
sudo snap install slack --classic
sudo snap install whatsapp --classic
sudo snap install telegram-desktop
sudo snap install --classic kubectl
sudo apt install -y docker-compose

sudo chsh -s $(which zsh)


echo ""
echo "------------------------------- SETUP -----------------------------------"
echo ""  

mkdir ~/bin

cp ./scripts/* ~/bin 

echo 'alias c="code .'>> ~/.zshrc
echo 'alias cc="git add . && cz .'>> ~/.zshrc
echo 'PATH="$HOME/bin:$PATH"'>> ~/.zshrc

export PATH="$HOME/bin:$PATH"

echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'>> ~/.zshrc

npm completion >> ~/.zshrc

pnpm install-completion
pnpm install-completion zsh