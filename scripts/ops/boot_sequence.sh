#!/bin/bash
### eosio_boot_sequence - Initialize EOS Blockchain
### Create a default wallet, load eosio.bios & eosio.token contracts
source "${EOSIO_SCRIPT_HOME}/properties.sh"

#initialize BLOCKCHAIN - Create wallet, set up user & currency contract
echo "---------- initializing Blockchain... ----------"
source ${EOSIO_SCRIPT_HOME}/utils/create_wallet.sh
set -x

cd ~/eos/contracts/${EOSIO_BIOS}/
### Compile wast file if it doesn't already exist (build bug?)
if [ ! -f "eosio.bios.wast" ]
then
	eosiocpp -o ${EOSIO_BIOS}.wast ${EOSIO_BIOS}.cpp
fi

### Create or update the contract on an account 
### cleos set contract [OPTIONS] account contract-dir [wast-file] [abi-file]
### Positionals:
### account TEXT                The account to publish a contract for
### contract-dir TEXT           The path containing the .wast and .abi
### wast-file TEXT              The file containing the contract WAST or WASM relative to contract-dir
### abi-file TEXT               The ABI for the contract relative to contract-dir
cleos set contract ${EOSIO} ../${EOSIO_BIOS} -p ${EOSIO}

### Create an account, buy ram, stake for bandwidth for the account
### Usage: cleos create account [OPTIONS] creator name OwnerKey [ActiveKey]
### Positionals
###   creator TEXT                The name of the account creating the new account
###   name TEXT                   The name of the new account
###   OwnerKey TEXT               The owner public key for the new account
###   ActiveKey TEXT              The active public key for the new account
cleos create account ${EOSIO} ${EOS} ${OWNER_PUBLIC_KEY} ${ACTIVE_PUBLIC_KEY} -p ${EOSIO}
cleos get account ${EOSIO}
cleos get account ${EOS}

cd ~/eos/contracts/${EOSIO_TOKEN}
### Compile wast file if it doesn't already exist (build bug?)
if [ ! -f "eosio.token.wast" ]
then
	eosiocpp -o ${EOSIO_TOKEN}.wast ${EOSIO_TOKEN}.cpp
fi

cleos set contract ${EOS} ../${EOSIO_TOKEN} ${EOSIO_TOKEN}.wast ${EOSIO_TOKEN}.abi -p ${EOS}

### Push a transaction with a single action ###
### Usage: cleos push action [OPTIONS] account action data
### Positionals:
###   account TEXT                The account providing the contract to execute
###   action TEXT                 A JSON string or filename defining the action to execute on the contract
###   data TEXT                   The arguments to the contract
cleos push action ${EOS} create '{"issuer":"'${EOS}'","maximum_supply":"1000000000.0000 EOS","can_freeze":"0","can_recall":"0","can_whitelist":"0"}' -p ${EOS}



#cleos push action ${EOS} create '{"issuer":"eos","maximum_supply":"1000000.0000 EOS"}' -p ${EOS}
cleos push action ${EOS} issue '{"to":"'${EOS}'","quantity":"1000000000.0000 EOS","memo":"Issue everything to EOS"}' -p ${EOS}
#cleos push action ${EOS} issue '{"to":"eosio","quantity":"8675.0000 EOS","memo":"M2"}' -p ${EOS}

### Retrieve the contents of a database table
### cleos get table [OPTIONS] contract scope table
### Positionals:
###   contract TEXT               The contract who owns the table
###   scope TEXT                  The scope within the contract in which the table is found
###   table TEXT                  The name of the table as specified by the contract abi
cleos get table ${EOS} ${EOS} accounts
cleos get table ${EOS} ${EOSIO} accounts

#Retrieve the balance of an account for a given currency
#Usage: cleos get currency balance contract account [symbol]
#Positionals:
#	contract TEXT               The contract that operates the currency
# 	account TEXT                The account to query balances for
#	symbol TEXT                 The symbol for the currency if the contract operates multiple currencies
cleos get currency balance ${EOS} ${EOSIO}
cleos get currency balance ${EOS} ${EOS}

#Push transaction than view new total
#cleos push action ${EOS} transfer '{"from":"eos","to":"eosio","quantity":"20.0000 EOS","memo":"my first transfer"}' -p ${EOS}
