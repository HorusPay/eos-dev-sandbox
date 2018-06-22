#EOSIO Workspace Properties
#Do not put real keys here

USER="scott"

#Wallet Info
WALLET_SRC=/home/${USER}/eosio-wallet
DATA_SRC="/home/${USER}/.local/share/eosio/nodeos/data"
#Read wallet password from convenient super-unsafe plain-text file
#Stored locally in plain text for dev convenience
WALLET_PASSWORD=$(<${EOSIO_SCRIPT_HOME}/password.txt)

#Workspace Resources
CONTRACTS_DIR="~/eos/contracts"

#Default Keys (if you want to re-use the same ones - (can regenerate any time)
MASTER_PUBLIC_KEY="EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV"
MASTER_PRIVATE_KEY="5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3"
OWNER_PUBLIC_KEY="EOS5tKWqoeRenxNctHWJqzLYgmL8MqC3KDZsmfe1JFf31LgtV71V7"
OWNER_PRIVATE_KEY="5KgQnPr41xnjCfDLcctEYsfEnqbWu7wn5w1txbk2YZurkWbvmYh"
ACTIVE_PUBLIC_KEY="EOS5iBKH8KxAU4BLomJseyhWVvwmTiU4a98xKVwLciPZosHgJ66Z5"
ACTIVE_PRIVATE_KEY="5JhkMn1vP6omtS4nwzWvZX9a6rjuXmpDY7kiMiXSbHW2XRowG5D"

LOGFILE="/media/sf_eosio_shared/log"

#Token & Account Info
EOS_TEST_USERS=(scott joe jack jarib jesse gunnar)
EOSIO_BIOS="eosio.bios"
EOSIO_TOKEN="eosio.token"
EOS="eos"
EOSIO="eosio"