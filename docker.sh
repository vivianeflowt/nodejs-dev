#!/bin/bash

clear

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi -f $(docker images -aq)

docker pull ubuntu

docker image ls
docker image rm nodedev

docker build --force-rm -t nodedev .

docker create --name nodedev -it nodedev /bin/bash

docker start nodedev

# docker exec -it nodedev /bin/zsh

# docker pull ubuntu &

echo "###############################################################################"
echo "Container IP address: "
docker inspect -f "{{ .NetworkSettings.IPAddress }}" nodedev
echo " "
echo "Connect to container with:"
echo "docker exec -it nodedev /bin/bash "
echo " "
echo "###############################################################################"
