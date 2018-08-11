#!/bin/bash
### eosioprint.sh
### Iterates through the blockchain and prints out useful info
source "${EOSIO_SCRIPT_HOME}/properties.sh"

# Print currency balances for each user
numTokens=${#TOKENS[@]}
for user in "${USERS[@]}"
do
	echo "================================="
	echo $user ' Balances'
	for (( i=0; i<${numTokens}; i++ ));
	do
		cleos get currency balance ${TOKEN_OWNERS[i]} $user ${TOKENS[i]}
		# cleos get table eosio.token ${i} accounts
	done
done
