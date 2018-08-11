## eos-dev-sandbox
## @author scott-schechter

Utility scripts and examples for working with the EOS Blockchain
Feel free to borrow, modify and build on these ideas.
When creating a default wallet, the password is stored in a plain text file called password.txt
This is obviously not secure and is meant for ease of development. 
You probably shouldn't run these while connected to the main net

# Append the following lines to '~/.bashrc' and these aliased functions become available for use:
> export EOSIO_SCRIPT_HOME="<workspace_home>/eos-dev-sandbox/scripts" \
> source ${EOSIO_SCRIPT_HOME}/ops/set_environment.sh

# Please refer to ${EOSIO_SCRIPT_HOME}/ops/set_environment.sh for supported aliases

After you've set you're aliases, source a new terminal and run

>hp-run -b [Kill, reboot & initializes a new chain, compile & set contract, execute contract script] \
>hp-run -c [compile & set contract, execute contract script] \
>hp-run    [execute contract script] \

# Ops - tools to streamline your EOS development workflow
archive.sh: Kill Nodeos and backup wallet / data folders before cleaning them
boot.sh: Initialize an EOS chain: load system contract, creates test accounts and tokens
clean.sh: Kill Nodeos and delete all wallet and data files
deploy_contract.sh [Account Name] [Contract Name]: from within the directory, deploys a contract onto a running Nodeos
load_system_contract.sh: load the system contract (use boot instead)

# Utils - Reusable functions
account.sh [Account Name]: Creates an account by calling 'cleos system newaccount'
accounts.sh [Account Name]: Create accoutns in batches
create_account.sh [Account Name]: Creates an account with new generated owner & active keys under master
create_token.sh [Account Name]: Creates a custom Extended Asset and issues all tokens to its owner 
create_wallet.sh: creates a default wallet and saves the password to a plaintext file (** Not secure)
init_tokens.sh: creates an array of tokens and issues them to an array of users
help.sh: display the contents of this file which lists these functions and where to locate them
print.sh: prints the current state of the blockchain or whatever you need printed
wallet_unlock.sh: unlocks your wallet with password stored in password.txt

# Msig - Multi-sig examples (TODO: needs work)

# Examples
example-airdrop_lotto.sh [Name] [Symbol] [Ttotalcoins]: Create a coin and airdrop random tokens on users 
example-launchchain.sh: Boots chain, runs a few lottos, and prints the results


