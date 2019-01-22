#!/bin/sh
killall -9 cypher
bootnode_addr=cnode://"$(grep cnode bootnode.log|tail -n 1|awk -F '://' '{print $2}')"
./build/bin/cypher --datadir db init genesis.json
echo "bootnode地址：" $bootnode_addr
./build/bin/cypher --verbosity 0 --datadir db --ws --tps -wsaddr="0.0.0.0" --wsorigins "*" --networkid 123666 --onetport 7000 --port 16062 --rpcport 18002  --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --bootnodes $bootnode_addr --rpcapi eth,web3,personal console
