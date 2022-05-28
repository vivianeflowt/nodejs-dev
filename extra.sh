#!/bin/bash

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