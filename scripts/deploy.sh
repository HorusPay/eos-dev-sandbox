# This self-contained script is to install your contract into a test or production environment
# CONTRACT_PARENT="guessbparent"
CONTRACT_ACCOUNT="contractacct"
# Generate your own test keys:
# Owner
# Private key: 5Jeo6q59eYj7UMh6EbaaCA6nrESKvzH2xTeAHYDwP7kFT3DULQU
# Public key: EOS77VLGNedSyML3CtHkksDBD3WZM1GXqndL4b4peJwWwMWPFAMuU
# Active
# Private key: 5Jm2KTePjPoqzNcimwnjSbHzfJ9tTtcLz8mUY9djYdN5a2WoMst
# Public key: EOS67UXRJv4o4fkgBzgHUkv5PSqXt6y8gXxdLSvCrfZiMX6dNPXaG
CONTRACT_HOME="/home/scott/Projects/guessbitcoin/contracts"
CONTRACT_NAME="contractname"
CONTRACT_OWNER_PUBLIC_KEY="EOS77VLGNedSyML3CtHkksDBD3WZM1GXqndL4b4peJwWwMWPFAMuU"
# Import corresponding active private key into Scatter to login for EOScrow Admin view
CONTRACT_ACTIVE_PUBLIC_KEY="EOS67UXRJv4o4fkgBzgHUkv5PSqXt6y8gXxdLSvCrfZiMX6dNPXaG"
# Delegate the following resources from parent to contract on account creation

STAKE_NET="100.0000 SYS"
STAKE_CPU="100.0000 SYS"
BUY_RAM="10000.0000 SYS"

CLEOS="cleos"
# Params only included when '-live' flag is set on command line
CLEOS_PARAMS="-u http://dev.cryptolions.io:18888"

###########################################################################
if [ "$1" = "-live" ] || [ "$2" = "-live" ] || [ "$3" = "-live" ]; then
	CLEOS="$CLEOS $CLEOS_PARAMS"
fi

# Create the contract account if '-n' is set
# if [ "$1" = "-n" ] || [ "$2" = "-n" ]; then
# 	${CLEOS} system newaccount ${CONTRACT_PARENT} ${CONTRACT_ACCOUNT} ${CONTRACT_OWNER_PUBLIC_KEY} ${CONTRACT_ACTIVE_PUBLIC_KEY} --stake-net "$STAKE_NET" --stake-cpu "$STAKE_CPU" --buy-ram "$BUY_RAM" -p ${CONTRACT_PARENT}
# fi

# Compile first if '-c' is set
if [ "$1" = "-c" ] || [ "$2" = "-c" ]; then
	echo 'Compiling '$CONTRACT_NAME' . Set to account: '$CONTRACT_ACCOUNT''
	cd ${CONTRACT_HOME}/${CONTRACT_NAME} 
	eosiocpp -o ${CONTRACT_NAME}.wast ${CONTRACT_NAME}.cpp && 
	eosiocpp -g ${CONTRACT_NAME}.abi ${CONTRACT_NAME}.cpp
fi

# Set contract
${CLEOS} set contract ${CONTRACT_ACCOUNT} ${CONTRACT_HOME}/${CONTRACT_NAME} -p ${CONTRACT_ACCOUNT}
# Add the eosio.code permission to authorize the contract to make transfers
${CLEOS} set account permission ${CONTRACT_ACCOUNT} active '{"threshold":1,"keys":[{"key":"'$CONTRACT_ACTIVE_PUBLIC_KEY'", "weight":1}],"accounts":[{"permission":{"actor":"'$CONTRACT_ACCOUNT'","permission":"eosio.code"},"weight":1}],"waits":[]}' owner -p ${CONTRACT_ACCOUNT}
# Check that eosio.code was added to the active key
${CLEOS} get account ${CONTRACT_ACCOUNT}



