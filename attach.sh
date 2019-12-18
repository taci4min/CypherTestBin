#!/usr/bin/env bash
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

$BINDIR attach $CHAINDB/cypher.ipc