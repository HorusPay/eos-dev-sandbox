#!/bin/bash
### eosiorefresh - Force kill, clean all, reinitialization of the EOSIO boot sequence
source ${EOSIO_SCRIPT_HOME}/properties.sh
bash ${EOSIO_SCRIPT_HOME}/ops/clean.sh
echo "Launching nodeos................."
gnome-terminal -e 'nodeos --delete-all-blocks'
sleep .75
bash ${EOSIO_SCRIPT_HOME}/ops/boot_sequence.sh