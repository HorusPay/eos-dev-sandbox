PASSWORD=$(<${EOSIO_SCRIPT_HOME}/password.txt)
echo 'Unlocking wallet with local stored password'
cleos wallet unlock --password ${PASSWORD}