# EOSIO v1.2.0 Smart Contract Tutorial
by: Gunnar Pope on 8/16/18


This set of dev notes I recorded while walking thorugh the developers notes
posted on the [eosio developer's portal](https://developers.eos.io/eosio-cpp/docs/introduction-to-smart-contracts). I'm using Ubuntu 18.04 system and run two terminal windows - 1 for `nodeos` to interact with the blockchain and 1 for `cleos` commands to interact with nodeos and sign actions with my wallet.

* First off, open a terminal and start `nodeos` to start a block producing node.

```
$ nodeos -e -p eosio --plugin eosio::chain_api_plugin
        --plugin eosio::history_api_plugin

.....
2018-08-16T13:54:26.501 thread-0   producer_plugin.cpp:1295      produce_block        ] Produced block 00003179b22e6343... #12665 @ 2018-08-16T13:54:26.500 signed by eosio [trxs: 0, lib: 12664, confirmed: 0]
2018-08-16T13:54:27.001 thread-0   producer_plugin.cpp:1295      produce_block        ] Produced block 0000317a5dfd11ad... #12666 @ 2018-08-16T13:54:27.000 signed by eosio [trxs: 0, lib: 12665, confirmed: 0]
2018-08-16T13:54:27.500 thread-0   producer_plugin.cpp:1295      produce_block        ] Produced block 0000317b139445d7... #12667 @ 2018-08-16T13:54:27.500 signed by eosio [trxs: 0, lib: 12666, confirmed: 0]

```

* Open a new terminal window. Unlock your wallet, check if it is unlocked, and if you don't have the eosio account key (EOS6MRy...) imported to your wallet, add it.


```
~/eos $ cleos wallet unlock
password:

~/eos $ cleos wallet list
Wallets:
[
  "default *"
]

~/eos $ cleos wallet import --private-key 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
imported private key for: EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
```


* Use the account ${eosio} to upload the eosio.bios contract with @active permissions.
This account could be any EOSIO account name.


```
~/eos $ cleos set contract eosio build/contracts/eosio.bios -p eosio@active
Reading WASM from build/contracts/eosio.bios/eosio.bios.wasm...
Publishing contract...
executed transaction: e21617635c447eee18e908b3283e46b59648837a776ddf9ea0602d98d1a6932a  3720 bytes  1842 us
#         eosio <= eosio::setcode               {"account":"eosio","vmtype":0,"vmversion":0,"code":"0061736d0100000001621260037f7e7f0060057f7e7e7e7e...
#         eosio <= eosio::setabi                {"account":"eosio","abi":"0e656f73696f3a3a6162692f312e30050c6163636f756e745f6e616d65046e616d650f7065...
2018-08-16T12:09:19.514 thread-0   main.cpp:455                  print_result   warning: transaction executed locally, but may not be confirmed by the network yet
```

* Now that the bios contact is built, create some keys for a new account


```
~/eos $ cleos create key --to-console
Private key: 5JHasbXY3zCNaMhLb1MMhdDd72EJDFSywYDaoxwa7p1TwyJEUVT
Public key: EOS6QvdEGw67NLdJe15jCQkTNFJDZvj9oNvKheKw2fbob3g6rer8K
~/eos $ cleos wallet import
private key: imported private key for: EOS6QvdEGw67NLdJe15jCQkTNFJDZvj9oNvKheKw2fbob3g6rer8K
```
* Build two new accounts named ${user} and ${tester}


```
~/eos $ cleos create account eosio user EOS6QvdEGw67NLdJe15jCQkTNFJDZvj9oNvKheKw2fbob3g6rer8K EOS6QvdEGw67NLdJe15jCQkTNFJDZvj9oNvKheKw2fbob3g6rer8K
executed transaction: 701e0f4bdd4ee70d33ac57f00809af1b97dee654a07e6e4d90535f4facc7cacf  200 bytes  928 us
#         eosio <= eosio::newaccount            {"creator":"eosio","name":"user","owner":{"threshold":1,"keys":[{"key":"EOS6QvdEGw67NLdJe15jCQkTNFJD...
2018-08-16T12:20:17.432 thread-0   main.cpp:455                  print_result      warning: transaction executed locally, but may not be confirmed by the network yet
~/eos $ cleos create account eosio tester EOS6QvdEGw67NLdJe15jCQkTNFJDZvj9oNvKheKw2fbob3g6rer8K EOS6QvdEGw67NLdJe15jCQkTNFJDZvj9oNvKheKw2fbob3g6rer8K
executed transaction: 559be9ac016df1507e2b6959862f6c01a4c567c47f820d8fa56c0767d543d18c  200 bytes  250 us
#         eosio <= eosio::newaccount            {"creator":"eosio","name":"tester","owner":{"threshold":1,"keys":[{"key":"EOS6QvdEGw67NLdJe15jCQkTNF...
2018-08-16T12:20:35.203 thread-0   main.cpp:455                  print_result      warning: transaction executed locally, but may not be confirmed by the network yet
```
* View the accounts created.


```
~/eos $ cleos get accounts EOS6QvdEGw67NLdJe15jCQkTNFJDZvj9oNvKheKw2fbob3g6rer8K
{
  "account_names": [
    "tester",
    "user"
  ]
}

```

* Now that the eosio.bios contract has been uploaded, let's create an account called ${eosio.token}


```
~/eos $ cleos create account eosio eosio.token EOS6QvdEGw67NLdJe15jCQkTNFJDZvj9oNvKheKw2fbob3g6rer8K EOS6QvdEGw67NLdJe15jCQkTNFJDZvj9oNvKheKw2fbob3g6rer8K
executed transaction: 41503f1b9ac0f8abf77b1a2bf9af784a45c46c7f0fc0840f83fa0c59a673291f  200 bytes  271 us
#         eosio <= eosio::newaccount            {"creator":"eosio","name":"eosio.token","owner":{"threshold":1,"keys":[{"key":"EOS6QvdEGw67NLdJe15jC...
2018-08-16T12:30:08.737 thread-0   main.cpp:455                  print_result      warning: transaction executed locally, but may not be confirmed by the network yet
```

* Now load the eosio.token contract into the eosio.token account


```
~/eos $ cleos set contract eosio.token build/contracts/eosio.token -p eosio.token@active
Reading WASM from build/contracts/eosio.token/eosio.token.wasm...
Publishing contract...
executed transaction: 1781f4c1968e7f60e9e979aaa90356c3209a137d0f48aad1b391c96d329f43ad  8104 bytes  3028 us
#         eosio <= eosio::setcode               {"account":"eosio.token","vmtype":0,"vmversion":0,"code":"0061736d01000000017e1560037f7e7f0060057f7e...
#         eosio <= eosio::setabi                {"account":"eosio.token","abi":"0e656f73696f3a3a6162692f312e30010c6163636f756e745f6e616d65046e616d65...
2018-08-16T12:32:27.549 thread-0   main.cpp:455                  print_result      warning: transaction executed locally, but may not be confirmed by the network yet
```

* You could use any account to upload this contract. Example: make an account
named gunnar.token and upload the same contract:


```
~/eos $ cleos create account eosio gunnar.token EOS6QvdEGw67NLdJe15jCQkTNFJDZvj9oNvKheKw2fbob3g6rer8K EOS6QvdEGw67NLdJe15jCQkTNFJDZvj9oNvKheKw2fbob3g6rer8K
executed transaction: 21d6c1b5e31f16751d446a10fdb96d926cd1f4966871ceb908ea191c49b21eec  200 bytes  273 us
#         eosio <= eosio::newaccount            {"creator":"eosio","name":"gunnar.token","owner":{"threshold":1,"keys":[{"key":"EOS6QvdEGw67NLdJe15j...
2018-08-16T12:43:16.781 thread-0   main.cpp:455                  print_result      warning: transaction executed locally, but may not be confirmed by the network yet


~/eos $ cleos set contract gunnar.token build/contracts/eosio.token -p gunnar.token@active
Reading WASM from build/contracts/eosio.token/eosio.token.wasm...
Publishing contract...
executed transaction: 8da1cceca9d4b4acadd43de216d61b83d39c7b5f87615fe955236318321229a7  8104 bytes  1266 us
#         eosio <= eosio::setcode               {"account":"gunnar.token","vmtype":0,"vmversion":0,"code":"0061736d01000000017e1560037f7e7f0060057f7...
#         eosio <= eosio::setabi                {"account":"gunnar.token","abi":"0e656f73696f3a3a6162692f312e30010c6163636f756e745f6e616d65046e616d6...
2018-08-16T12:43:36.867 thread-0   main.cpp:455                  print_result      warning: transaction executed locally, but may not be confirmed by the network yet
```

* Now, create a token using this contract. The gunnar.token contract will create
1 Million 'SKI' tokens


```
~/eos $ cleos push action gunnar.token create '["eosio", "1000000.000 SKI"]' -p gunnar.token@active
executed transaction: 39895f61b1cf62269a52d3f4f1343643af4039ea786d3ee021075d76a9b8167e  120 bytes  361 us
#  gunnar.token <= gunnar.token::create         {"issuer":"eosio","maximum_supply":"1000000.000 SKI"}
2018-08-16T12:50:17.436 thread-0   main.cpp:455                  print_result      warning: transaction executed locally, but may not be confirmed by the network yet

```


* Or, you can create a token using the positional arguments. To begin, use
cleos to get the gunnar.token action arguments from the .abi file:


```
~/eos $ cleos get abi gunnar.token
{
  "version": "eosio::abi/1.0",
  "types": [{
      "new_type_name": "account_name",
      "type": "name"
    }
  ],
  "structs": [{
      "name": "transfer",
      "base": "",
      "fields": [{
          "name": "from",
          "type": "account_name"
        },{
          "name": "to",
          "type": "account_name"
        },{
          "name": "quantity",
          "type": "asset"
        },{
          "name": "memo",
          "type": "string"
        }
      ]
    },{
      "name": "create",
      "base": "",
      "fields": [{
          "name": "issuer",
          "type": "account_name"
        },{
          "name": "maximum_supply",
          "type": "asset"
        }
      ]
    },{
      "name": "issue",
      "base": "",
      "fields": [{
          "name": "to",
          "type": "account_name"
        },{
          "name": "quantity",
          "type": "asset"
        },{
          "name": "memo",
          "type": "string"
        }
      ]
    },{
      "name": "account",
      "base": "",
      "fields": [{
          "name": "balance",
          "type": "asset"
        }
      ]
    },{
      "name": "currency_stats",
      "base": "",
      "fields": [{
          "name": "supply",
          "type": "asset"
        },{
          "name": "max_supply",
          "type": "asset"
        },{
          "name": "issuer",
          "type": "account_name"
        }
      ]
    }
  ],
  "actions": [{
      "name": "transfer",
      "type": "transfer",
      "ricardian_contract": ""
    },{
      "name": "issue",
      "type": "issue",
      "ricardian_contract": ""
    },{
      "name": "create",
      "type": "create",
      "ricardian_contract": ""
    }
  ],
  "tables": [{
      "name": "accounts",
      "index_type": "i64",
      "key_names": [
        "currency"
      ],
      "key_types": [
        "uint64"
      ],
      "type": "account"
    },{
      "name": "stat",
      "index_type": "i64",
      "key_names": [
        "currency"
      ],
      "key_types": [
        "uint64"
      ],
      "type": "currency_stats"
    }
  ],
  "ricardian_clauses": [],
  "error_messages": [],
  "abi_extensions": []
}

```


* Look at the .abi file and see that there is an action called "create"
that has a "structs" of type "create". Look into the "structs" section to find
what arguments it takes. We can see that the "create" struct has two fields:
"issuer", "maximum_supply".


```
"actions": [
      .....
      {
      "name": "create",
      "type": "create",
      "ricardian_contract": ""
    }
  ],


"structs": [
    .....
    {
      "name": "create",
      "base": "",
      "fields": [{
          "name": "issuer",
          "type": "account_name"
        },{
          "name": "maximum_supply",
          "type": "asset"
        }
      ]
    }
```

Therefore, we can pass these arguments in a json
format to the cleos push action command using `'{"issuer":"eosio", "maximum_supply":"1000000.0000 GCP"}'`


```
~/eos $ cleos push action gunnar.token create '{"issuer":"eosio", "maximum_supply":"1000000.0000 GCP"}' -p gunnar.token@active
executed transaction: 2ada0aa1c34e61fa4fcbe7c6becf11b37305176f5d3eac462b022363db81af94  120 bytes  350 us
#  gunnar.token <= gunnar.token::create         {"issuer":"eosio","maximum_supply":"1000000.0000 GCP"}
2018-08-16T12:55:00.418 thread-0   main.cpp:455                  print_result      warning: transaction executed locally, but may not be confirmed by the network yet
```
* Issue tokens to account ${user}.


```
~/eos $ cleos push action gunnar.token issue '[ "user", "100.0000 GCP", "memo"]' -p eosio@active
executed transaction: 6ff6aaf959a05e631b947c3b29f1a081180c63e0d5653354d9a396295482db8e  128 bytes  1002 us
#  gunnar.token <= gunnar.token::issue          {"to":"user","quantity":"100.0000 GCP","memo":"memo"}
#  gunnar.token <= gunnar.token::transfer       {"from":"eosio","to":"user","quantity":"100.0000 GCP","memo":"memo"}
#         eosio <= gunnar.token::transfer       {"from":"eosio","to":"user","quantity":"100.0000 GCP","memo":"memo"}
#          user <= gunnar.token::transfer       {"from":"eosio","to":"user","quantity":"100.0000 GCP","memo":"memo"}
2018-08-16T13:09:59.939 thread-0   main.cpp:455                  print_result      warning: transaction executed locally, but may not be confirmed by the network yet

```
* Incorporate a memo into your transction stating "payment for services".


```
~/eos $ cleos push action gunnar.token issue '[ "user", "100.0000 GCP", "payment for services"]' -p eosio@active
executed transaction: 2fba791c246b6d6929a0bbc799bc12fc5367904d2f37a634d3c170a4193106fb  144 bytes  1713 us
#  gunnar.token <= gunnar.token::issue          {"to":"user","quantity":"100.0000 GCP","memo":"payment for services"}
#  gunnar.token <= gunnar.token::transfer       {"from":"eosio","to":"user","quantity":"100.0000 GCP","memo":"payment for services"}
#         eosio <= gunnar.token::transfer       {"from":"eosio","to":"user","quantity":"100.0000 GCP","memo":"payment for services"}
#          user <= gunnar.token::transfer       {"from":"eosio","to":"user","quantity":"100.0000 GCP","memo":"payment for services"}
2018-08-16T13:12:06.906 thread-0   main.cpp:455                  print_result      warning: transaction executed locally, but may not be confirmed by the network yet
```

That's all for now! We'll do another tutorial tonight or tomorrow and keep the eos development going. Please let me know if you like these tutorials and how I can improve them.

## Next step:
Finish the multi sig tutorials from the eosio github page.
https://developers.eos.io/eosio-cpp/docs/token-tutorial
