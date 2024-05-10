#! /bin/bash

sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)
sudo docker volume prune
sudo docker rmi -f $(sudo docker images -q)
sudo docker volume ls
sudo docker images