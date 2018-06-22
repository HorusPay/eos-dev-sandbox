## eos-dev-sandbox
## @author sschechter

Utility scripts and examples for working with the EOS Blockchain
Feel free to borrow, modify and build on these ideas

# Append the following lines to '~/.bashrc' and these aliased functions become available for use:
> export EOSIO_WS_HOME="<MY_DIRECTORY>"
> export EOSIO_SCRIPT_HOME="${EOSIO_WS_HOME}/eos-dev-sandbox/scripts"
> source ${EOSIO_SCRIPT_HOME}/set_environment.sh

# Ops - tools to streamline your EOS development workflow
eds-archive: Kill Nodeos and backup wallet / data folders before cleaning them
eds-boot_sequence: Deploys the sytem.bios & system.token contracts
eds-clean: Kill Nodeos and delete all wallet and data files
eds-reboot: Cleans and reboots a fresh blockchain

# Utils - Reusable functions
eds-create_account [Account Name]: Creates an account with new generated owner & active keys
eds-create_wallet: creates a default wallet and saves the password to a plaintext file (** Not secure)
eds-deploy_contract [Account Name] [Contract Name]: from within the directory, deploys a contract onto a running Nodeos
eds-help: display the contents of this file which lists these functions and where to locate them
eds-print: prints the current state of the blockchain

# Examples
eds-example-airdrop_lotto [Name] [Symbol] [Ttotalcoins]: Create a coin and airdrop random tokens on users 
eds-example-launchchain: Boots chain, runs a few lottos, and prints the results


