source ${EOSIO_SCRIPT_HOME}/properties.sh

# Lets assume we have four accounts created on the network:
#     mymultisig11 - a multisig account we will configure
#     partner11111 - Bob’s personal account
#     partner22222 - Joe’s personal account
#     partner33333 - Dave’s personal account
# bash ${EOSIO_SCRIPT_HOME}/account.sh mymultisig11 ${OWNER_PUBLIC_KEY}
# bash ${EOSIO_SCRIPT_HOME}/account.sh partner11111 ${OWNER_PUBLIC_KEY}
# bash ${EOSIO_SCRIPT_HOME}/account.sh partner22222 ${OWNER_PUBLIC_KEY}
# bash ${EOSIO_SCRIPT_HOME}/account.sh partner33333 ${OWNER_PUBLIC_KEY}

cleos set account permission mymultisig11 active '{"threshold":2,"keys":[],"accounts":[{"permission":{"actor":"partner11111","permission":"active"},"weight":1},{"permission":{"actor":"partner22222","permission":"active"},"weight":1},{"permission":{"actor":"partner33333","permission":"active"},"weight":1}],"waits":[]}' owner -p mymultisig11@owner

# cleos set account permission mymultisig11 owner '{"threshold":2,"keys":[],"accounts":[{"permission":{"actor":"partner11111","permission":"owner"},"weight":1},{"permission":{"actor":"partner22222","permission":"owner"},"weight":1},{"permission":{"actor":"partner33333","permission":"owner"},"weight":1}],"waits":[]}' -p mymultisig11@owner

cleos get account mymultisig11

cleos multisig propose payme '[{"actor": "partner22222", "permission": "active"},{"actor": "partner33333", "permission": "active"}]' '[{"actor": "mymultisig11", "permission": "active"}]' eosio.token transfer '{"from":"mymultisig11", "to":"partner11111", "quantity":"25.0000 SYS", "memo":"Pay partner11111 some money"}' partner11111 -p partner11111@active 

cleos multisig review partner11111 payme
#cleos multisig review partner11111 payme -p partner22222@active

cleos multisig approve partner11111 payme '{"actor": "partner22222", "permission": "active"}' -p partner22222@active

cleos multisig approve partner11111 payme '{"actor": "partner33333", "permission": "active"}' -p partner33333@active

cleos multisig exec partner11111 payme -p partner11111@active
