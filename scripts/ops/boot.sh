#!/bin/bash
#Immediately kills, cleans, boots and redeploys a fresh EOS chain 
source ${EOSIO_SCRIPT_HOME}/properties.sh
### Force kill, clean all, reinitialization of the EOSIO boot sequence
bash ${EOSIO_SCRIPT_HOME}/ops/clean.sh
echo "Launching nodeos................."
gnome-terminal -e 'nodeos --delete-all-blocks --contracts-console'
sleep .75
# Create wallet, set up user & currency contract
echo "---------- Creating Default Wallet ... ----------"
bash ${EOSIO_SCRIPT_HOME}/utils/create_wallet.sh
echo "---------- Loading System Contract ... ----------"
bash ${EOSIO_SCRIPT_HOME}/ops/load_system_contract.sh
echo "---------- Initializing Project ... ----------"
bash ${EOSIO_SCRIPT_HOME}/utils/init_project_data.sh
echo "---------- Distributing Test Tokens ... ----------"
source ${EOSIO_SCRIPT_HOME}/utils/init_tokens.sh
