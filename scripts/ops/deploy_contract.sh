#!/bin/bash
#Compiles c++ contract into wast & abi then deploys to the running blockchain

if [[ $# -ne 2 ]]; then
    echo "USAGE: deploy_contract.sh <Account Name> <Contract Name> from within the directory"
    exit 1
fi

ACCOUNT=$1
CONTRACT=$2

eosiocpp -o ${CONTRACT}.wast ${CONTRACT}.cpp && 
eosiocpp -g ${CONTRACT}.abi ${CONTRACT}.cpp && 
cleos set contract ${ACCOUNT} ../${CONTRACT}
