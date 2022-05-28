#!/bin/zsh

echo ""
echo "###############################################################################"
echo "#############################  INSTALL  #######################################"
echo "###############################################################################"
echo ""

cd ~

sudo apt update -y 

echo ""
echo "################################################################################"
echo "# NODE VERSION MANAGER                                                         #"
echo "################################################################################"
echo ""

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
wait

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# nvm ls-remote

source ~/.zshrc

nvm install node
nvm install-latest-npm
nvm install --lts

nvm install v10.24.1
nvm install v12.22.12
nvm install v14.19.2

nvm install v16.15.0
nvm use v16.15.0
nvm use default v16.15.0

echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"'>> ~/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'>> ~/.zshrc

echo ""
echo "###############################################################################"
echo "# OH MY SHELL                                                                 #"
echo "###############################################################################"
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
echo "###############################################################################"
echo "# START SSH                                                                   #"
echo "###############################################################################"
echo ""

sudo service ssh start
sudo /etc/init.d/ssh start
sudo /etc/init.d/ssh restart

npm install --global pnpm typescript tslib ts-node esbuild esbuild-register rimraf @types/node
                     