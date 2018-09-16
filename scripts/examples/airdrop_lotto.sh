#!/bin/bash
### ico - Distribute coins randomly to new accounts
### Create a default wallet, load eosio.bios & eosio.token contracts
source "${HORUS_SCRIPT_HOME}/properties.sh"

if [ $# != 3 ] 
then
	echo "Usage: ico [coinname] [symbol] [quantity]"
	exit
fi
#TODO -Validate [quantity] for decimal number if you want
COINNAME=${1}
echo "Coinname: ${COINNAME}, Symbol: ${2}, Quantity: ${3}"
#cleos wallet unlock --password ${WALLET_PASSWORD}

# Create the COIN account to issue currency to
source ${EOSIO_SCRIPT_HOME}/create_account.sh ${COINNAME}
# Issue the currency
cleos push action ${EOS} create '{"issuer":"'${COINNAME}'","maximum_supply":"'${3}' '${2}'","can_freeze":"0","can_recall":"0","can_whitelist":"0"}' -p ${EOS}

for USER in "${EOS_TEST_USERS[@]}"
do	
   #Issue currency for each USER -p ${EOS}
   RAND=$(echo $RANDOM % 1000 + 1 | bc)
	cleos push action ${EOS} issue '{"to":"'${USER}'","quantity":"'${RAND}' '${2}'","memo":"Random Value"}' -p ${COINNAME}
	#cleos push action ${EOS} transfer '{"from":"'${EOS}'","to":"'${USER}'","quantity":"200.0000 EOS","memo":"transfering some EOS"}' -p ${EOS}
done

#cleos push action ${EOS} issue '{"to":"eosio","quantity":"8675.0000 EOS","memo":"Issue some EOS"}' -p ${EOS}
#cleos push action ${EOS} transfer '{"from":"eos","to":"eosio","quantity":"20.0000 EOS","memo":"my first transfer"}' -p ${EOS}
