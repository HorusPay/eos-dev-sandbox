#Utiltiy scripts and examples for working with the EOS Blockchain
#Append 'source <this.file>' to '~/.bashrc' and open a new terminal to make these scripts automatically accessible
#@author scott-schechter

#PRE - If you'd prefer a different prefix for these shortcuts than the default 'eds' 
# 		you can change it here (help commands might fall out of date)
PRE="hp"
alias ${PRE}=${PRE}-help

alias ${PRE}-accounts='bash ${HORUS_SCRIPT_HOME}/utils/accounts.sh'
alias ${PRE}-boot='bash ${HORUS_SCRIPT_HOME}/ops/boot.sh'
alias ${PRE}-create_account='bash ${HORUS_SCRIPT_HOME}/utils/create_account.sh'
alias ${PRE}-create_token='bash ${HORUS_SCRIPT_HOME}/utils/create_token.sh'
alias ${PRE}-deploy_contract='bash ${HORUS_SCRIPT_HOME}/ops/deploy_contract.sh'
alias ${PRE}-home='cd ${HORUS_SCRIPT_HOME};cd ..'
alias ${PRE}-init_tokens='bash ${HORUS_SCRIPT_HOME}/utils/init_tokens.sh'
alias ${PRE}-msig='bash ${HORUS_SCRIPT_HOME}/msig/msig.sh'
alias ${PRE}-msig-active='bash ${HORUS_SCRIPT_HOME}/msig/msig-active.sh'
alias ${PRE}-msig-example='bash ${HORUS_SCRIPT_HOME}/msig/msig-example.sh'
alias ${PRE}-print='bash ${HORUS_SCRIPT_HOME}/utils/print.sh'
alias ${PRE}-run='bash ${HORUS_SCRIPT_HOME}/run.sh'
alias ${PRE}-help='cat ${HORUS_SCRIPT_HOME}/ops/set_environment.sh'
alias ${PRE}-wallet_unlock='bash ${HORUS_SCRIPT_HOME}/utils/wallet_unlock.sh'



