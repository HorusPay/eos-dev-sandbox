#!/bin/bash
### create_account.sh
### Create a user account (under master name for now) and assign it keys
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

#cleos create account eosio dudcoin EOS6b9UtGzEW2cyhME2gMBMh9dbDf8jtDTxpQRdF1mxRoNiyJ5iKK EOS5vkjirAoaNNXVYLZg2QneQk6eeT3ExhGiGhnWtLLMyeTgUXt9G
#cleos create account eosio kirk EOS883B2uLELM5uSmVmdDPd7VKehj9Wp6Yjf48RCWP5KHAvFLCyQa EOS5NKBdbFrCa92cTX9EQHQbhYSESjmpd19rT18YN8BSsGoALVncz
