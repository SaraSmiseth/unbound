#!/bin/zsh

./buildImage.zsh
sudo docker-compose up
sudo docker-compose down
