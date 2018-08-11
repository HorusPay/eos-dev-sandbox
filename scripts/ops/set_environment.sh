#Utiltiy scripts and examples for working with the EOS Blockchain
#Append 'source <this.file>' to '~/.bashrc' and open a new terminal to make these scripts automatically accessible
#@author scott-schechter

#PRE - If you'd prefer a different prefix for these shortcuts than the default 'eds' 
# 		you can change it here (help commands might fall out of date)
PRE="hp"
alias ${PRE}=${PRE}-help

alias ${PRE}-accounts='bash ${EOSIO_SCRIPT_HOME}/utils/accounts.sh'
alias ${PRE}-boot='bash ${EOSIO_SCRIPT_HOME}/ops/boot.sh'
alias ${PRE}-create_account='bash ${EOSIO_SCRIPT_HOME}/utils/create_account.sh'
alias ${PRE}-create_token='bash ${EOSIO_SCRIPT_HOME}/utils/create_token.sh'
alias ${PRE}-deploy_contract='bash ${EOSIO_SCRIPT_HOME}/ops/deploy_contract.sh'
alias ${PRE}-init_tokens='bash ${EOSIO_SCRIPT_HOME}/utils/init_tokens.sh'
alias ${PRE}-msig='bash ${EOSIO_SCRIPT_HOME}/msig/msig.sh'
alias ${PRE}-msig-active='bash ${EOSIO_SCRIPT_HOME}/msig/msig-active.sh'
alias ${PRE}-msig-example='bash ${EOSIO_SCRIPT_HOME}/msig/msig-example.sh'
alias ${PRE}-print='bash ${EOSIO_SCRIPT_HOME}/utils/print.sh'
alias ${PRE}-run='bash ${EOSIO_SCRIPT_HOME}/run.sh'
alias ${PRE}-help='cat ${EOSIO_SCRIPT_HOME}/ops/set_environment.sh'
alias ${PRE}-wallet_unlock='bash ${EOSIO_SCRIPT_HOME}/utils/wallet_unlock.sh'



