#!/bin/bash
#Issues a new token to a new custom contract, and issues all shares to the creator.
if [ "$#" -ne 3 ]; then
    echo "Usage: create_token.sh <ISSUER_ACCOUNT_NAME> <ISSUER_PUBLIC_KEY> <SYMBOL>"
    exit 1
fi
source ${HORUS_SCRIPT_HOME}/properties.sh

ISSUER=$1
PUBLIC_KEY=$2
SYMBOL=$3

cleos system newaccount eosio $ISSUER $PUBLIC_KEY $PUBLIC_KEY \
                --stake-net "200.0000 SYS" --stake-cpu "2000.0000 SYS" \
                --buy-ram "1000.0000 SYS" -p eosio

cleos set contract ${ISSUER} ${EOS_HOME}/build/contracts/eosio.token/ -p ${ISSUER}
PARAMS1="[\"$ISSUER\", \"1000000000.0000 $SYMBOL\"]"
PARAMS2="[\"$ISSUER\", \"1000000000.0000 $SYMBOL\", \"Memo\"]"
cleos push action ${ISSUER} create "${PARAMS1}" -p ${ISSUER}
cleos push action ${ISSUER} issue "${PARAMS2}" -p ${ISSUER}
