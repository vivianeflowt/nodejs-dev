#!/bin/bash

cd ~

echo ""
echo "------------------------ INSTALL - APT-PACKAGES ----------------------------"
echo ""

sudo apt update -y
sudo apt install -y git htop curl wget tar nano net-tools build-essential zsh zsh-antigen fonts-powerline
sudo apt install -y apt-transport-https ca-certificates software-properties-common sqlite gparted

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

npm update -g npm

curl -fsSL https://get.pnpm.io/install.sh | sh -

npm install -g yarn
npm install -g typescript ts-node ts-node-dev tslib typesync
npm install -g jest ts-jest
npm install -g prettier eslint
npm install -g rimraf syncpack release-it commitizen cz-conventional-changelog ultra-runner depcheck
npm install -g memfs unionfs core.js lodash
npm install -g @vercel/ncc esbuild esbuild-register 
npm install -g rollup bundle-deps microbundle webpack webpack-cli
npm install -g @nestjs/cli
npm install -g nodemon concurrently

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
antigen bundle heroku
antigen bundle autojump
antigen bundle compleat
antigen bundle git-extras
antigen bundle git-flow
antigen bundle npm
antigen bundle command-not-found

# NVM bundle
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm
antigen bundle Sparragus/zsh-auto-nvm-use

antigen bundle buonomo/yarn-completion
antigen bundle lukechilds/zsh-nvm
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme spaceship-prompt/spaceship-prompt
antigen apply

sudo chsh -s $(which zsh)

echo ""
echo "------------------------------- SETUP -----------------------------------"
echo ""  

mkdir ~/bin


echo 'alias c="code .'>> ~/.zshrc
echo 'alias cc="git add . && cz .'>> ~/.zshrc
echo 'PATH="$HOME/bin:$PATH"'>> ~/.zshrc

export PATH="$HOME/mybin:$PATH"
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'>> ~/.zshrc

npm completion >> ~/.zshrc

pnpm install-completion
pnpm install-completion zsh


# sudo apt install -y --install-recommends flatpak snapd

# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo apt install -f -y ./google-chrome-stable_current_amd64.deb
# rm -rf google-chrome-stable_current_amd64.deb

# curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
# sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
# sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
# sudo apt update
# sudo apt install -y code


# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
# sudo apt update
# apt-cache policy docker-ce
# sleep 10
# sudo apt install -y docker-ce

# sudo snap install postman
# sudo snap install heroku --classic
# sudo snap install insomnia-designer
# sudo snap install postbird

