PASSWORD=$(<${EOSIO_SCRIPT_HOME}/utils/password.txt)
echo 'Unlocking wallet with local stored password'
cleos wallet unlock --password ${PASSWORD}