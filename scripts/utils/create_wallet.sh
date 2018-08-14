#!/bin/bash
### Store wallet password in memory and back it up to plain text
### so we can save it or automate it later (WARN: Dev only, not secure)
source "$EOSIO_SCRIPT_HOME/properties.sh"

echo THIS NO LONGER WORKS AFTER LATEST UPDATE OF EOSIO

# echo "Wallet created - Exporting pw to $EOSIO_SCRIPT_HOME/utils/password.txt for your convenience:"
# echo cleos wallet create > $EOSIO_SCRIPT_HOME/utils/password.txt

# echo "Import Owner and Active Keys"
# cleos wallet import $OWNER_PRIVATE_KEY
# cleos wallet import $ACTIVE_PRIVATE_KEY