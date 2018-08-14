source $EOSIO_SCRIPT_HOME/properties.sh

bash $EOSIO_SCRIPT_HOME/utils/account.sh $CONTRACT_OWNER $OWNER_PUBLIC_KEY
echo 'issue tokens to ' $CONTRACT_OWNER

# TODO fix hard coding
cleos push action eosio.token transfer '[ "eosio", "horustokenio", "100001.0000 SYS", "here you go" ]' -p eosio
cleos system newaccount $CONTRACT_OWNER $CONTRACT_ACCOUNT $OWNER_PUBLIC_KEY $OWNER_PUBLIC_KEY --stake-net "100.0000 SYS" --stake-cpu "2000.0000 SYS" --buy-ram "10000.0000 SYS" -p $CONTRACT_OWNER
cleos system newaccount $CONTRACT_OWNER $HP_MULTI $OWNER_PUBLIC_KEY $OWNER_PUBLIC_KEY --stake-net "100.0000 SYS" --stake-cpu "2000.0000 SYS" --buy-ram "10000.0000 SYS" -p $CONTRACT_OWNER

cleos push action eosio.token transfer '[ "eosio", "horuspaydemo", "100002.0000 SYS", "here you go" ]' -p eosio

cleos get currency balance eosio.token horustokenio SYS
cleos get currency balance eosio.token $CONTRACT_ACCOUNT}SYS
cleos get currency balance eosio.token $HP_MULTI SYS

# cleos push action eosio.token transfer '[ "eosio", "horuspaymsig", "100000.0000 SYS", "here you go" ]' -p eosio
#cleos push action ${EOS} issue '{"to":"'${USER}'","quantity":"'${RAND}' '${2}'","memo":"Random Value"}' -p ${COINNAME}
#cleos push action ${EOS} transfer '{"from":"'${EOS}'","to":"'${USER}'","quantity":"200.0000 EOS","memo":"transfering some EOS"}' -p ${EOS}