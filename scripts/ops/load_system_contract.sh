#!/bin/bash
#@author nsjames
#https://github.com/EOSEssentials/EOSHelpers/blob/master/dev/setup_nodeos.sh

# Creates and deploys the eosio.system contract and associated accounts 
# Uses the standard EOSIO public key to initialize.
source ${HORUS_SCRIPT_HOME}/properties.sh

KEY=${OWNER_PUBLIC_KEY}
 
# Create system accounts
cleos create account ${EOSIO} eosio.token ${KEY} ${KEY} -p ${EOSIO}
cleos create account ${EOSIO} eosio.msig ${KEY} ${KEY} -p ${EOSIO}
cleos create account ${EOSIO} eosio.ram ${KEY} ${KEY} -p ${EOSIO}
cleos create account ${EOSIO} eosio.ramfee ${KEY} ${KEY} -p ${EOSIO}
cleos create account ${EOSIO} eosio.stake ${KEY} ${KEY} -p ${EOSIO}
cleos create account ${EOSIO} eosio.saving ${KEY} ${KEY} -p ${EOSIO}
cleos create account ${EOSIO} eosio.bpay ${KEY} ${KEY} -p ${EOSIO}
cleos create account ${EOSIO} eosio.names ${KEY} ${KEY} -p ${EOSIO}
cleos create account ${EOSIO} eosio.vpay ${KEY} ${KEY} -p ${EOSIO}
cleos create account ${EOSIO} eosio.upay ${KEY} ${KEY} -p ${EOSIO}

# Deploy Token & Msig Contracts
# Single node implementation no need to load system.bios contract
cleos set contract ${EOSIO} ${EOS_HOME}/build/contracts/${EOSIO_BIOS}/ -p ${EOSIO}
cleos set contract eosio.token ${EOS_HOME}/build/contracts/eosio.token/ -p eosio.token
cleos push action eosio.token create '[ "eosio", "1000000000.0000 SYS"]' -p eosio.token
cleos push action eosio.token issue '[ "eosio", "1000000000.0000 SYS", "init" ]' -p ${EOSIO}
cleos set contract eosio.msig ${EOS_HOME}/build/contracts/eosio.msig/ -p eosio.msig

# Set the system contract - times out first times, works second time
cleos set contract ${EOSIO} ${EOS_HOME}/build/contracts/${EOSIO_SYSTEM}/ -p ${EOSIO} -x 3000
sleep .5
cleos set contract ${EOSIO} ${EOS_HOME}/build/contracts/${EOSIO_SYSTEM}/ -p ${EOSIO} -x 3000

# Elevate multi-sig privileges
echo 'elevate eosio.msig privileges'
cleos push action eosio setpriv '["eosio.msig", 1]' -p eosio@active

#RAM DEFAULT - can only increase this value from 64GB
#echo 'setram {"max_ram_size":64599818083}'
#cleos push action eosio setram '{"max_ram_size":64599818083}' -p eosio

