#!/bin/bash
### eosioprint.sh
### Iterates through the blockchain and prints out useful info
source "${EOSIO_SCRIPT_HOME}/properties.sh"

#This needs works but still can be used as template for similar printing methods 
for i in "${EOS_TEST_USERS[@]}"
do	
   #Display balance for each user -p ${EOS}
   echo "================================="
   echo "${i}'s Wallet"
   cleos get currency balance ${EOS} ${i}
   #echo "---------------------------------"
   #get currency balance ${EOS} ${i}
   #View as table
   cleos get table ${EOS} ${i} accounts
   #cleos get table ${EOS} ${i} stat
done