#Utiltiy scripts and examples for working with the EOS Blockchain
#Append 'source <this.file>' to '~/.bashrc' and open a new terminal to make these scripts automatically accessible
#@author sschechter

#PRE - If you'd prefer a different prefix for these shortcuts than the default 'eds' 
# 		you can change it here (help commands might fall out of date)
PRE="eds"
alias ${PRE}=${PRE}-help

#Ops
alias ${PRE}-archive='bash ${EOSIO_SCRIPT_HOME}/ops/archive.sh'
alias ${PRE}-boot_sequence='bash ${EOSIO_SCRIPT_HOME}/ops/boot_sequence.sh'
alias ${PRE}-clean='bash ${EOSIO_SCRIPT_HOME}/ops/clean.sh'
alias ${PRE}-help='cat ${EOSIO_WS_HOME}/eos-dev-sandbox/README.md'
alias ${PRE}-reboot='bash ${EOSIO_SCRIPT_HOME}/ops/reboot.sh'
alias ${PRE}-reboot_contract='bash ${EOSIO_SCRIPT_HOME}/ops/reboot_contract.sh'
#Utils
alias ${PRE}-create_account='bash ${EOSIO_SCRIPT_HOME}/utils/create_account.sh'
alias ${PRE}-create_wallet='bash ${EOSIO_SCRIPT_HOME}/utils/create_wallet.sh'
alias ${PRE}-deploy_contract='bash ${EOSIO_SCRIPT_HOME}/utils/deploy_contract.sh'
alias ${PRE}-print='bash ${EOSIO_SCRIPT_HOME}/utils/print_blockchain.sh'
alias ${PRE}-wallet_unlock='bash ${EOSIO_SCRIPT_HOME}/utils/wallet_unlock.sh'
#Examples 
alias ${PRE}-example-airdrop_lotto='bash ${EOSIO_SCRIPT_HOME}/examples/airdrop_lotto.sh'
alias ${PRE}-example-launchchain='bash ${EOSIO_SCRIPT_HOME}/examples/launchchain.sh'

