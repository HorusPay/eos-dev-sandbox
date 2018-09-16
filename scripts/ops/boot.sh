#!/bin/bash
#Immediately kills, cleans, boots and redeploys a fresh EOS chain 
source ${HORUS_SCRIPT_HOME}/properties.sh
### Force kill, clean all, reinitialization of the HORUS boot sequence
bash ${HORUS_SCRIPT_HOME}/ops/clean.sh
echo "Launching nodeos................."
# gnome-terminal -e 'nodeos --delete-all-blocks --contracts-console'
# bash ${HORUS_SCRIPT_HOME}/ops/start_nodeos.sh
osascript -e 'tell app "Terminal"
    do script "bash ${HORUS_SCRIPT_HOME}/ops/start_nodeos.sh"
	end tell'
# open -a Terminal.app ${HORUS_SCRIPT_HOME}/ops/start_nodeos.sh
sleep .75

# Create wallet, set up user & currency contract
echo "---------- Creating Default Wallet ... ----------"
bash ${HORUS_SCRIPT_HOME}/utils/create_wallet.sh
echo "---------- Loading System Contract ... ----------"
bash ${HORUS_SCRIPT_HOME}/ops/load_system_contract.sh
echo "---------- Initializing Project ... ----------"
bash ${HORUS_SCRIPT_HOME}/utils/init_project_data.sh
echo "---------- Distributing Test Tokens ... ----------"
source ${HORUS_SCRIPT_HOME}/utils/init_tokens.sh
