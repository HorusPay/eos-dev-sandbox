source ${EOSIO_SCRIPT_HOME}/properties.sh

if [ "$1" = "-c" ] || [ "$1" = "-b" ]; then
	if [ "$1" = "-b" ]; then
		# boot a fresh chain
		bash ${EOSIO_SCRIPT_HOME}/ops/boot.sh
	fi
	###########################################
	#Compile, set contract & init
	###########################################
	echo 'Set contract '$CONTRACT' to '$CONTRACT_ACCOUNT' account'
    cd ${PROJECT_CONTRACT_HOME}
	eosiocpp -o ${CONTRACT}.wast ${CONTRACT}.cpp && 
	eosiocpp -g ${CONTRACT}.abi ${CONTRACT}.cpp && 
	cleos set contract ${CONTRACT_ACCOUNT} ../${CONTRACT} -p ${CONTRACT_ACCOUNT}

	###########################################
	# Init: Run this only the first time the contract is loaded [example: init data, permisions]
	###########################################
	cleos push action ${CONTRACT_ACCOUNT} hi '["horustester1"]' -p ${CONTRACT_ACCOUNT}
	cleos push action ${CONTRACT_ACCOUNT} hi '["horustester2"]' -p horustester3

	# Allow contract code to make transactions on behalf of its code's owner
	cleos set account permission ${CONTRACT_ACCOUNT} active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"horuspaydemo","permission":"active"},"weight":1},{"permission":{"actor":"horuspaydemo","permission":"eosio.code"},"weight":1}],"waits":[]}' owner -p ${CONTRACT_ACCOUNT}

	# TODO - correct syntax to swap ${CONTRACT_ACCOUNT} for "horuspaydemo"
	cleos push action eosio.token transfer '[ "horustester1", "horuspaydemo", "100.0000 SYS", "to the contract" ]' -p horustester1

	cleos get currency balance eosio.token ${CONTRACT_ACCOUNT} SYS

	# Query your contracts table stored in EOS RAM
	#cleos get table ${CONTRACT_ACCOUNT} ${CONTRACT_ACCOUNT} #name

# End compile, set contract, init 
fi
###########################################
#### Test your contract actions here
###########################################
cleos get account horustester3

cleos push action horustokenio transfer '[ "horustester1", "horuspaydemo", "100.0000 HORUS", "deposit" ]' -p horustester1
cleos push action eosio.token transfer '[ "horustester2", "horuspaydemo", "1000.0000 EOS", "deposit" ]' -p horustester2
cleos push action eosio.token transfer '[ "horustester3", "horuspaydemo", "1000.0000 SYS", "deposit" ]' -p horustester3

### TODO - why is this failing? (Taken from a working example)
# Allow contract code to make transactions on behalf of its code's owner
cleos set account permission ${CONTRACT_ACCOUNT} active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"horuspaydemo","permission":"active"},"weight":1},{"permission":{"actor":"horuspaydemo","permission":"eosio.code"},"weight":1}],"waits":[]}' owner -p ${CONTRACT_ACCOUNT}

cleos get currency balance eosio.token horustester1 SYS




