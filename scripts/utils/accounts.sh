#!/bin/bash
#@author nsjames
#https://github.com/EOSEssentials/EOSHelpers/blob/master/dev/accounts.sh

# Batch account creation function

ACCOUNTS=(horusvendor1 horusvendor2 horusvendor3 horusvendor4 horusvendor5)
create(){
        cleos system newaccount eosio $1 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "100.0000 SYS" --stake-cpu "250.0000 SYS" --buy-ram "2000.0000 SYS" -p eosio
	        #EOS5AwwyqQTsrMTkBbGxkbJz9vMugi7d3zHBRiGvbWv1eU4dGYc4v (active)
}

for name in "$ACCOUNTS[@]"
do
    create $name
done
