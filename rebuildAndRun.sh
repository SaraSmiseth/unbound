#!/bin/zsh

./buildImage.sh
sudo docker-compose up
sudo docker-compose down
