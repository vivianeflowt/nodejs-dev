
#!/bin/bash

clear

# docker volume create portainer_data
# docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

# docker stop $(docker ps -a -q)
# docker rm $(docker ps -a -q)
# docker start $(docker ps -a -q)

# docker run -it ubuntu --name ubuntu-setup
# docker run -it --name vivi ubuntu

docker create --name $1 -it ubuntu bash
docker ps -a

docker start $1

docker exec -i $1 apt update -y 
docker exec -i $1 apt install sudo -y 
docker exec -i $1 apt upgrade -y 
docker exec -i $1 apt install -y git curl wget nano vim htop zsh && sudo apt autoremove -y

docker ps -a

docker exec -i $1 git clone https://github.com/gurudavivi/ubuntudev.git

docker stop $1
docker start $1

docker ps -a


# docker exec -it vivi4 bash
# apt update -y && apt install git sudo -y && cd && git clone https://github.com/gurudavivi/ubuntudev.git && cd ubuntudev
