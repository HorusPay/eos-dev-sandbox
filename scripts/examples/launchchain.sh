#!/bin/bash
### launchchain - A sandbox where anything can happen
source "${EOSIO_SCRIPT_HOME}/properties.sh"
source "${EOSIO_SCRIPT_HOME}/ops/eosio_reboot.sh"
#cleos wallet unlock --password ${WALLET_PASSWORD}

# Create accounts for 'dummy users'
for i in "${EOS_TEST_USERS[@]}"
do
   #Create accounts for each name
   bash ${EOSIO_SCRIPT_HOME}/create_account.sh ${i}
done

bash ${EOSIO_SCRIPT_HOME}/examples/airdrop_lotto.sh brokencoin BRK 6489155
bash ${EOSIO_SCRIPT_HOME}/examples/airdrop_lotto.sh dumbcoin DRT 50000
bash ${EOSIO_SCRIPT_HOME}/examples/airdrop_lotto.sh leaguepoints DFL 15000

bash ${EOSIO_SCRIPT_HOME}/eosioprint.sh
