#!/bin/bash

git pull
make cypher
make bootnode
systemctl stop cypher.service
systemctl stop boot.service
sleep 2
rm -rf /root/.ethash/*
./run.sh cleandb 1
./run.sh init 1

systemctl start cypher.service
systemctl start boot.service
sleep .5

systemctl status cypher.service -l
systemctl status boot.service -l
sleep .5

./build/bin/cypher attach chaindb/1/cypher.ipc
