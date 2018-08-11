#!/bin/bash
### create_account.sh
### Create a user account under the master name, bypassing resource requirements
### Use account.sh to create new accounts through the system contract (cleos system newaccount)
source "${EOSIO_SCRIPT_HOME}/properties.sh"

if [ "${#}" -ne 1 ];
then
	echo "Error: account could not be created"
	echo "Must use exactly one paramater: create_account.sh [account name]"
	exit
fi

#Parses output into keys from 'cleos create key'
CREATE_KEY_PRIV_INDEX=2
CREATE_KEY_PUB_INDEX=5

KEYS=$(cleos create key)
KEYS=($KEYS)
OWNER_PRIV_KEY=${KEYS[${CREATE_KEY_PRIV_INDEX}]}
OWNER_KEY=${KEYS[${CREATE_KEY_PUB_INDEX}]}

KEYS=$(cleos create key)
KEYS=($KEYS)
ACTIVE_PRIV_KEY=${KEYS[${CREATE_KEY_PRIV_INDEX}]}
ACTIVE_KEY=${KEYS[${CREATE_KEY_PUB_INDEX}]}

cleos create account ${EOSIO} ${1} ${OWNER_KEY} ${ACTIVE_KEY}

#echo "Import Owner and Active Keys under our main ${EOSIO} account"
cleos wallet import ${OWNER_PRIV_KEY}
cleos wallet import ${ACTIVE_PRIV_KEY}
