source ${HORUS_SCRIPT_HOME}/properties.sh
# horustokenio horuspaydemo horuspaymsig  partner11111 partner22222 partner33333
P_NAME=customgroup

PROPOSAL_NAME=$1

cleos set account permission horuspaymsig active '{"threshold":2,"keys":[],"accounts":[{"permission":{"actor":"horuspaydemo","permission":"active"},"weight":2},{"permission":{"actor":"horustester2","permission":"active"},"weight":1},{"permission":{"actor":"horustester3","permission":"active"},"weight":1}],"waits":[]}' owner -p horuspaymsig@active 

cleos set account permission horuspaymsig ${P_NAME} '{"threshold":2,"keys":[],"accounts":[{"permission":{"actor":"horuspaydemo","permission":"active"},"weight":2},{"permission":{"actor":"horustester2","permission":"active"},"weight":1},{"permission":{"actor":"horustester3","permission":"active"},"weight":1}],"waits":[]}' active -p horuspaymsig@active

# cleos set account permission mycompanyacct companygroup '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"horustester1","permission":"active"},"weight":1},{"permission":{"actor":"horustester2","permission":"active"},"weight":1},{"permission":{"actor":"horustester3","permission":"active"},"weight":1}],"waits":[]}' active -p mycompanyacct@active

cleos get account ${HP_MSIG}
echo 'get currency balance $CONTRACT_OWNER $CONTRACT_ACCOUNT $HP_MSIG'
cleos get currency balance eosio.token ${CONTRACT_OWNER} SYS
cleos get currency balance eosio.token ${CONTRACT_ACCOUNT} SYS
cleos get currency balance eosio.token ${CONTRACT_ACCOUNT} SYS

cleos multisig propose ${PROPOSAL_NAME} '[{"actor": "horustester2", "permission": "active"},{"actor": "horustester3", "permission": "active"}]' '[{"actor": "horuspaymsig", "permission": "active"}]' eosio.token transfer '{"from":"horuspaymsig", "to":"horuspaydemo", "quantity":"25.0000 SYS", "memo":"Pay horuspaydemo some money"}' -p horuspaydemo@active 

cleos multisig propose ${PROPOSAL_NAME}b '[{"actor": "horustester2", "permission": "active"},{"actor": "horustester3", "permission": "active"}]' '[{"actor": "horuspaymsig", "permission": "active"}]' eosio.token transfer '{"from":"horuspaymsig", "to":"horuspaydemo", "quantity":"25.0000 SYS", "memo":"Pay horuspaydemo some money"}' -p horuspaydemo@active 

#cleos multisig review horuspaydemo ${PROPOSAL_NAME}
cleos multisig review horuspaydemo ${PROPOSAL_NAME}b

cleos multisig approve horuspaydemo ${PROPOSAL_NAME} '{"actor": "horustester2", "permission": "active"}' -p horustester2@active

cleos multisig approve horuspaydemo ${PROPOSAL_NAME} '{"actor": "horustester3", "permission": "active"}' -p horustester3@active

cleos multisig exec horuspaydemo ${PROPOSAL_NAME} -p horuspaydemo@active

# cleos multisig review horuspaydemo ${PROPOSAL_NAME}

# Permission not required? Is that because I already have key in wallet?
# echo '--Delete custom privlige'
# cleos set account permission horuspaymsig ${TID} NULL delete
# cleos set account permission horuspaymsig ${TID} NULL delete -p horuspaymsig@active

