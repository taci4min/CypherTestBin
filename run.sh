#!/bin/bash
BOOTDIR="./bootnode.log"
GENESISDIR="./genesis.json"
LOGLEVEL=3
bootnode_addr=cnode://"$(grep cnode $BOOTDIR|tail -n 1|awk -F '://' '{print $2}')"

IPENCDISVALUE=1
CLIDETAILMODE="--detail"
CLISILENTMODE="--silent"
CLIMODE=$CLIDETAILMODE

if [[ "$1" != "" ]];then
   CLIMODE=$1
fi

ostype()
{
  osname=`uname -s`
 # echo "osname $osname"
  OSTYPE=UNKNOWN
  case $osname in
     "FreeBSD") OSTYPE="freebsd"
     ;;
     "SunOS") OSTYPE="solaris"
     ;;
     "Linux") OSTYPE="linux"
     ;;
     "Darwin") OSTYPE="mac"
     ;;
     "linux") OSTYPE="linux"
     ;;
     "darwin") OSTYPE="mac"
     ;;
     *) echo "other system $osname"
     ;;
    esac
  return 0
}
ostype
CHAINDB="./$OSTYPE/chaindb"
BINDIR="./$OSTYPE/cypher"

#echo "CHAINDB $CHAINDB"
#echo "BINDIR $BINDIR"
killall -9 cypher
NetWorkId=`less genesis.json|awk -F "[:]" '/chainId/{print $2}'`
NetWorkId=`echo $NetWorkId | cut -d \, -f 1`
echo "bootnode address: " $bootnode_addr
echo "Client print mode:$CLIMODE,please wait for some seconds!"
if [[ "$CLIMODE" == "$CLIDETAILMODE" || "$CLIMODE" == "0" || "$CLIMODE" == " " ]];then
   $BINDIR  --onetport 7100 --nat "none" --ws --tps --ipencdis $IPENCDISVALUE -wsaddr="0.0.0.0" --wsorigins "*" --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --rpcapi cph,web3,personal,miner --port 16002 --rpcport 8000 --verbosity $LOGLEVEL --datadir $CHAINDB --networkid $NetWorkId --gcmode archive --bootnodes $bootnode_addr console
else
   $BINDIR  --onetport 7100 --nat "none" --ws --tps --ipencdis $IPENCDISVALUE -wsaddr="0.0.0.0" --wsorigins "*" --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --rpcapi cph,web3,personal,miner --port 16002 --rpcport 8000 --verbosity $LOGLEVEL --datadir $CHAINDB --networkid $NetWorkId --gcmode archive --bootnodes $bootnode_addr  2>"7100.log" &
   #sleep 5
   #$BINDIR attach $CHAINDB/cypher.ipc
fi


