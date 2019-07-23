#!/bin/sh
OSTYPE=$1
NODE_DIR="./$OSTYPE/chaindb"
BOOTDIR="./bootnode.log"
GENESISDIR="./genesis.json"
LOGLEVEL=3
BINDIR="./$OSTYPE/cypher"
bootnode_addr=cnode://"$(grep cnode $BOOTDIR|tail -n 1|awk -F '://' '{print $2}')"
$BINDIR --datadir "$NODE_DIR" init $GENESISDIR
IPENCDISVALUE=1
CLIDETAILMODE="--detail"
CLISILENTMODE="--silent"
CLIMODE=$CLIDETAILMODE

if [ "$2" != "" ];then
   CLIMODE=$2
fi

NetWorkId=`less genesis.json|awk -F "[:]" '/chainId/{print $2}'`
NetWorkId=`echo $NetWorkId | cut -d \, -f 1`
echo "bootnode address: " $bootnode_addr
echo "Client print mode: " $CLIMODE

while [ $# -ge 2 ] ; do
        case "$CLIMODE" in
                $CLISILENTMODE) LOGLEVEL=1 ;shift 2;;
                *) echo "unknown parameter $2." ; exit 1 ; break;;
        esac
done

$BINDIR  --onetport 7000 --nat "none" --ws --tps --ipencdis $IPENCDISVALUE -wsaddr="0.0.0.0" --wsorigins "*" --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --rpcapi cph,web3,personal,miner --port 16002 --rpcport 18002 --verbosity $LOGLEVEL --datadir $NODE_DIR --networkid $NetWorkId --gcmode archive --bootnodes $bootnode_addr console

