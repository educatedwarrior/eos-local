#!/usr/bin/env bash

echo "Installing EOSIO"
sudo apt -y install /opt/application/utils/eosio_1.5.0-1-ubuntu-18.04_amd64.deb

source $(dirname $0)/stop.sh

echo "Starting eosio service ..."
LOGFILE=/opt/application/logs/nodeos.log

# always a new log file
rm $LOGFILE && touch $LOGFILE

nodeos --config-dir $CONFIG_DIR --data-dir $DATA_DIR -e >> $LOGFILE 2>&1 & echo $! > $DATA_DIR/nodeos.pid & tail -f $LOGFILE

