#!/bin/sh

# 解析bootnode地址:
bootnode_addr=cnode://"$(grep cnode bootnode.log|tail -n 1|awk -F '://' '{print $2}')"
./build/bin/cypher --datadir db init genesis.json
echo "bootnode地址：" $bootnode_addr
./build/bin/cypher  --datadir db --networkid 123666 --onetport 7000 --port 16062 --rpcport 18002 --verbosity 4 --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --bootnodes $bootnode_addr --rpcapi eth,web3,personal console
