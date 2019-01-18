#!/bin/bash
killall -9 cypher
./run.sh cleandb 1
./run.sh init 1
sleep .5
./build/bin/cypher attach chaindb/1/cypher.ipc
