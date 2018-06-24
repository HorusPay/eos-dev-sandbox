#!/bin/bash
### eosioclean - Clean EOS Blockchain
### WARNING: Deletes all wallets & blockchain data
### Next time use 'eosarchive.sh' if you want to backup data before cleaning (adds latency)
source "${EOSIO_SCRIPT_HOME}/properties.sh"

#MAINNET IS LIVE -- BE CAREFUL UNTIL YOU UNDERSTAND COMPLETELY THE RAMIFICATIONS
#ENSURE YOU ARE CONNECTED TO A TEST NET BEFOPE UNCOMMENTING
CMD_DELETE_WALLET="rm -r ${WALLET_SRC}"
CMD_DELETE_DATE="rm -r ${DATA_SRC}"

echo "WARNING: Quick deleting all wallet & blockchain info"
echo "Next time use 'eosarchive.sh' if you want to backup data before cleaning (adds latency)"

set -x
#Stop nodeos from creating new blocks of data
pkill -9 nodeos
rm -r ${DATA_SRC}
rm -r ${WALLET_SRC}
#Re-create 'eosio-wallet' directory as nodeos doesn't do this
mkdir ${WALLET_SRC}

echo "EOS Wallet & Data deleted - Blockchain clean"