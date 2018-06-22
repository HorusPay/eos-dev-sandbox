#!/bin/bash
#Immediately cleans, boots and deploys a contract to a fresh chain 

if [[ $# -ne 2 ]]; then
    echo "USAGE: deploy_contract.sh <Account Name> <Contract Name> from within the directory"
    exit 1
fi

bash ${EOSIO_SCRIPT_HOME}/ops/reboot.sh

ACCOUNT=$1
CONTRACT=$2

eosiocpp -o ${CONTRACT}.wast ${CONTRACT}.cpp && 
eosiocpp -g ${CONTRACT}.abi ${CONTRACT}.cpp && 
cleos set contract ${ACCOUNT} ../${CONTRACT}
