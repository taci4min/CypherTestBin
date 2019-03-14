#!/bin/sh
OSTYPE=$1
NODE_DIR="./$OSTYPE/db"
BOOTDIR="./bootnode.log"
GENESISDIR="./genesis.json"
BINDIR="./$OSTYPE/cypher"
bootnode_addr=cnode://"$(grep cnode $BOOTDIR|tail -n 1|awk -F '://' '{print $2}')"
$BINDIR --datadir "$NODE_DIR" init $GENESISDIR
echo "bootnode address：" $bootnode_addr
$BINDIR  --onetport 7000 --nat "none" --ws --tps -wsaddr="0.0.0.0" --wsorigins "*" --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --rpcapi eth,web3,personal,miner,admin,net,txpool --port 16002 --rpcport 18002 --verbosity 0 --datadir $NODE_DIR --networkid 123888 --gcmode archive --bootnodes $bootnode_addr console 2>"$NODE_DIR/output.log"
