#!/bin/bash
### Store wallet password in memory and back it up to plain text 
### so we can save it or automate it later (WARN: Dev only, not secure)
source "${HORUS_SCRIPT_HOME}/properties.sh"

OUTPUT=$(cleos wallet create --to-console)
KEYS=($OUTPUT)
WALLET_PASSWORD=$(echo ${KEYS[22]}| cut -d'"' -f 2)

echo "Wallet created - Exporting pw to ${EOSIO_SCRIPT_HOME}/utils/password.txt for your convenience:"
echo "PW: ${WALLET_PASSWORD}"
echo ${WALLET_PASSWORD} > ${EOSIO_SCRIPT_HOME}/utils/password.txt

echo "Import Owner and Active Keys"
cleos wallet import --private-key ${OWNER_PRIVATE_KEY} 
cleos wallet import --private-key ${ACTIVE_PRIVATE_KEY}