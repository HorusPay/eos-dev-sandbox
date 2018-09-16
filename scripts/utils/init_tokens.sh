source ${HORUS_SCRIPT_HOME}/properties.sh

# Create trading partners
bash ${HORUS_SCRIPT_HOME}/utils/account.sh horustester1 ${OWNER_PUBLIC_KEY}
bash ${HORUS_SCRIPT_HOME}/utils/account.sh horustester2 ${OWNER_PUBLIC_KEY}
bash ${HORUS_SCRIPT_HOME}/utils/account.sh horustester3 ${OWNER_PUBLIC_KEY}

# cleos push action eosio.token create '[ "eosio", "1000000000.0000 SYS"]' -p eosio.token
# cleos push action eosio.token issue '[ "eosio", "1000000000.0000 SYS", "init" ]' -p ${EOSIO}
# cleos push action eosio.token issue '[ "horustester1", "100000.0000 EOS", "EOS issue" ]' -p eosio.token
cleos push action eosio.token transfer '[ "eosio", "horustester1", "100000.0000 SYS", "sys for all" ]' -p eosio
cleos push action eosio.token transfer '[ "eosio", "horustester2", "200000.0000 SYS", "here you go" ]' -p eosio
cleos push action eosio.token transfer '[ "eosio", "horustester3", "300000.0000 SYS", "and you" ]' -p eosio

# get length of an array
echo '### WARN: there may be several false failures because the SYS token was already loaded'
numTokens=${#TOKENS[@]}
for (( i=0; i<${numTokens}; i++ ));
do
	bash ${EOSIO_SCRIPT_HOME}/utils/create_token.sh ${TOKEN_OWNERS[i]} ${OWNER_PUBLIC_KEY} ${TOKENS[i]}
	for user in "${USERS[@]}"
	do
		PARAMS="[\"${TOKEN_OWNERS[i]}\", \"$user\", \"50000.0000 ${TOKENS[i]}\", \"The memo\"]"
		cleos push action ${TOKEN_OWNERS[i]} transfer "${PARAMS}" -p ${TOKEN_OWNERS[i]}
		cleos get currency balance ${TOKEN_OWNERS[i]} $user ${TOKENS[i]}
	done
done


