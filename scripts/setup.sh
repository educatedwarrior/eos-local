#!/bin/bash
echo "Building eos wallet external docker volume"
docker volume create --name=keosd-data-volume

echo "Building images"
docker-compose build

echo "Initializing docker containers"
docker-compose up -d eosio

read -p "Initializing Chain data (y/n)? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  docker-compose exec eosio /opt/application/scripts/init-chain.sh
fi

docker-compose up -d
