#!/bin/sh

# 解析bootnode地址:
bootnode_addr=cnode://"$(grep cnode bootnode.log|tail -n 1|awk -F '://' '{print $2}')"

echo "bootnode地址：" $bootnode_addr
./build/bin/cypher  --datadir db --networkid 123666 --onetport 7000 --port 16061 --rpcport 18000 --verbosity 4 --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --bootnodes $bootnode_addr --rpcapi eth,web3,personal console