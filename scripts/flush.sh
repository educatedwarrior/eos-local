#!/bin/bash
echo "Flushing all blockchain and database data"
docker-compose down -v

echo "=======================IMPORTANT================================"
echo "The wallet docker volume and the eoslocal wallet password file are not removed by this command."
echo "That is in order avoid losing keys."
echo "================================================================"
