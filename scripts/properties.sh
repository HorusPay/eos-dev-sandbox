#EOS Workspace Properties
USER="scott"
EOS_HOME="/Users/${USER}/eos"
CONTRACT_OWNER="horustokenio"
CONTRACT_ACCOUNT="horuspaydemo"
HP_MULTI="horuspaymsig"
PROJECT_CONTRACT_HOME="/Users/${USER}/HorusPay/eos-dev-sandbox/contracts/hpdemo"

CONTRACT='hpdemo'

# Create test users and initalize them with a bunch of supported tokens
USERS=(horustester1 horustester2 horustester3 horuspaydemo)
# TOKEN_OWNERS AND TOKENS ARE PARALELL
TOKEN_OWNERS=(eosio.token eosio.token eosatidiumio gyztomjugage eosiochaince challengedac eosadddddddd ednazztokens eosdactokens eoxeoxeoxeox horustokenio therealkarma)
TOKENS=(SYS EOS ATD CETOS CET CHL ADD EDNA EOSDAC EOX HORUS KARMA)

#Wallet Info
WALLET_SRC=/Users/${USER}/eosio-wallet
DATA_SRC="/Users/${USER}/.local/share/eosio/nodeos/data"
#Read wallet password from convenient super-unsafe plain-text file
#Stored locally in plain text for dev convenience
WALLET_PASSWORD=$(<${EOSIO_SCRIPT_HOME}/utils/password.txt)

OWNER_PUBLIC_KEY="EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV"
OWNER_PRIVATE_KEY="5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3"
ACTIVE_PUBLIC_KEY="EOS5iBKH8KxAU4BLomJseyhWVvwmTiU4a98xKVwLciPZosHgJ66Z5"
ACTIVE_PRIVATE_KEY="5JhkMn1vP6omtS4nwzWvZX9a6rjuXmpDY7kiMiXSbHW2XRowG5D"

LOGFILE="/media/sf_eosio_shared/log"

#Token & Account Info
EOS_TEST_USERS=(scott joe jack jarib jesse gunnar)
EOSIO_BIOS="eosio.bios"
EOSIO_TOKEN="eosio.token"
EOSIO_SYSTEM="eosio.system"
EOS="eos"
EOSIO="eosio"
