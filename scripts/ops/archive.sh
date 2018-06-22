#!/bin/bash
### eosioarchive - Backup and delete EOS wallets & blockchain (adds latency)
source "${EOSIO_SCRIPT_HOME}/properties.sh"

TIMESTAMP="$(date +%Y-%m-%d_%Hh%Mm%Ss)"
BACKUP_WALLET_SRC=/home/scott/eosio-wallet
BACKUP_DATA_SRC="/home/scott/.local/share/eosio/nodeos/data"
BACKUP_DST="/media/sf_eosio_shared/backup_data/eosdata_${TIMESTAMP}"
CMD_BACKUP_WALLET="mv ${BACKUP_WALLET_SRC} ${BACKUP_DST}"
CMD_BACKUP_DATA="mv ${BACKUP_DATA_SRC} ${BACKUP_DST}"

echo "Creating backup data directory: $BACKUP_DST"
set -x
#Stop nodeos from creating new blocks of data
pkill -9 nodeos
#Move 'wallets' to backup destintion
${CMD_BACKUP_WALLET}
#Move 'data' to backup destination
${CMD_BACKUP_DATA}
#Re-create 'eosio-wallet' directory as nodeos doesn't do this
mkdir ${BACKUP_WALLET_SRC}

if [ -z "$(ls -A "${BACKUP_DST}")" ]; then
   #Backup made but nothing there so delete
   rm -r ${BACKUP_DST}
fi

echo "EOS Wallet and Data successfully backed up - Blockchain clean"