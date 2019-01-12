#!/bin/bash
# Install the necessary environments for running cypher
#

yum install git -y
yum install gcc -y
wget https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
tar -xzvf go1.10.3.linux-amd64.tar.gz

mkdir -p work/src/github/cypherium


