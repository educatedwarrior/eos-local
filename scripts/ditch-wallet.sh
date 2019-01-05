#!/bin/bash
docker volume rm keosd-data-volume
rm services/eosio/config/keys/eoslocal_wallet_password.txt
echo "removed keosd-data-volume and eoslocal_wallet_password.txt"
