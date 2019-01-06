#!/bin/bash

echo "Stopping all EOS Local services"

docker exec -i eoslocal_eosio ./scripts/stop.sh

docker-compose down
