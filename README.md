Cypherium Testnet Tutorial
===
Cypherium has just released its public testnet. This tutorial will help developers get the testnet up and running on your home computer,
 assign yourself a testwallet and fill that wallet with testnet Cypher coins. Remember these coins have no value. This tutorial will, however,
 demonstrate the speed and power of the Cypherium network. So please enjoy exploring the testnet. We’re confident it will get the community pumped for our robust release

Operating system support
---
Cypherium is compatible with Mac, Windows, and Linux operating systems.Now we just provide Mac and Linux platform TestBin.

Public iP for VPS is needed
--
Your ip of your machine or VPS which used to deploy cypher node  must be `public IP`.such AWS ec2 which has `public IP` to deploy your cypher node!
Please open 8000,6000,30301,7100 ports for UDP and TCP rule for VPS.Maybe you also need to shut firewalld.service by using command `systemctl stop firewalld.service`

Install the openssl
--

for linux
 ```
sudo apt-get install openssl
sudo apt-get install libssl-dev
 ```
for mac:
 ```
git clone https://github.com/openssl/openssl
cd openssl
sudo ./config --prefix=/usr/local/openssl
make
make install
openssl version
 ```
Download repository
---
 We suggest you switch your computer account to root account
 #### 1. Install Git:
   for linux,run follow command:
    ```
   sudo apt-get install git  
    ```

   for mac,visit follow URL to install:
    ```
    http://sourceforge.net/projects/git-osx-installer/
    ```
 #### 2. Open the terminal and clone repository:
 ```
  git clone https://github.com/cypherium/CypherTestBin.git
  cd CypherTestBin
  ls
 ```
 #### 3.List the mainly use files
  `resetStart.sh`:can delete chaindb automic,and restart chaind directly,the txBlock and keyBlock will syn from 0.
  `start.sh`:continue the txBlock and keyBlock Height,and going on.<br>

   Below are all start mode commands:<br>
   ```./start.sh --silent```or ```./start.sh 0``` :start cypher application and output the log to the cypherlog.txt<br>
   ```./start.sh --detail```or ```./start.sh 1```:start cypher application and print the log online<br>
   ```./resetStart.sh --silent```or ```./start.sh 0```:reset start cypher application and output the log to the cypherlog.txt<br>
   ```./resetStart.sh --detail```or ```./start.sh 1```:reset start cypher application and print the log online<br>

 Run the cypher
 ---

 #### init database
 We suggest you run the script under root account of computer
 for console detail print mode you should run this:
 ```
 sudo ./start.sh --silent
 ```
 or  for silent mode ,you should run this
 ```
 sudo ./start.sh
 ```
 now the log is output to the `cypherlog.txt` file,you can check  the dynamic log.
Congratulations! You have successfully started the Cypherium testnet!

Troubleshooting
---
   #### If you get `panic: not exists jdk class!` crash
   * Execute `sudo passwd` to create root password if you have not created.
   * Please give the `jdk` folder read/write permission by typing `sudo chmod -R 777 ./jdk`.
   #### If you cannot execute the bin, try the following tips:
   *  Make sure you are operating on the root account of your computer. (You can do this with the command “sudo” and entering your password.
   If you have not created a root password yet, `sudo passwd` will help you set a password to your root account.)
   * Execute command `sudo chmod -R 777 .` when your current directory path is at `../CypherTestBin/`
   * Execute `sudo rm -rf chaindb` to delete the database. Then, regenerate the database by executing `./cypher -–datadir chaindb  init ../genesis.json`
   * Execute shell `./resetStart.sh` can delete database automic,and restart directly.As soon as you finding the chainId is different from previous chaindId which is checked through executing
   *  Make sure you are operating on the root account of your computer. (You can do this with the command “su” and entering your password.
   If you have not created a root password yet, `sudo passwd` will help you set a password to your root account.)
   * Execute command `sudo chmod -R 777 .` when your current directory path is at `../CypherTestBin/`
   * Execute `sudo rm -rf chaindb` to delete the database. Then, regenerate the database by executing `./cypher -–datadir chaindb  init ../genesis.json`
   * Execute shell `./resetStart.sh` can delete database automic,and restart directly.As soon as you finding the chainId is different from previous chaindId which is checked through executing

   #### If KeyBlockNumber or TxBlockNumber of your node is stucked or show errors repeat.try the following tips:
   * The simplest way is to run "```./resetStart.sh```".This command will clean all db and sync start all over again,so will cost about several hours accourd to KeyBlockNumber and TxBlockNumer
     height.
   * Calculate the parent number "N-1" for finally stucked TxBlockNumber or KeyBlockNumber.We assume bad KeyBlockNumber N is 7077,so it's parent KeyBlockNumber is 7076:

      First we find this Block's(TxBlockNumber or KeyBlockNumber) hash.
      ```
      cph.getKeyBlockByNumber(7076)
      {
        EpochPubKey: "0xe3146bd0443f698896d88a64a4ce3520120f44cd01c70e091e7d672db5ad6bf9",
        checkpoint: "0x1b97",
        difficulty: "0xc5d486",
        exceptions: ["0xcde869fa7e1b8fc65906adea570ac7e406aa16fec37e92c6ec2f71d163804255", "0x105d040a81e4c11d20afc1e9035386e7b2a645f72d09d1386509dab703b8f2b6"],
        extraData: "0x",
        hash: "0x49be855b18f76868109b10b9e90c40f44b6af1f903f9fc67a695195c5a6ad82d",
        inAddress: ["e89ec57f938dd0ecc595763d4082cb0f05a05e87"],
        inPubKey: ["0xec4a9ecee032316be4777526e695a114d059374736b997d866cc713d164d579f"],
        leaderPubKey: "0xe52426a55834fac9a7b412bd58509bdec42869344a743a51a4cf712e1ef1f08e",
        mixHash: "0xd336142baa2129f3e2059b39aa83d464b4c685d39050f7e9993c4608ec387d23",
        nonce: "0x21baade4a3a39547",
        number: 7076,
        outAddress: ["4030936fda177443785e2e460d7971a68deb7c78"],
        outPubKey: ["0x9079dab73b879ee760ff469a00b39aeb43e562469f16728ffcf6bbfe5c56b1de"],
        parentHash: "0x0ea5219b93db8f98988dbde26ebb8c10e1f0924966ac25998454a1a051d9fc26",
        signature: "0xae9566bac614dbf78ebbdf07a65785579c3144ee80763c8d042c2ac76d9a5f3c4009b6069081c8499cf22e4ee93c1922d468babe5cbb2818994a2a6af9a9210280",
        signature1: "0x34790f7c8f7c532fae454569c534367dfb4fe0c2375d1045d436e78f9bc0c7020e7794fb3f3154b37b76ad468f598d6e7746c3b5e74d217adbb4f75a8104610180",
        size: 583,
        time: "0x5d3567e6",
        type: 301,
        version: "01"
      }
      ```
      We find hash is "0x49be855b18f76868109b10b9e90c40f44b6af1f903f9fc67a695195c5a6ad82d"
      ```
      cph.rollbackKeyChainFrom("0x49be855b18f76868109b10b9e90c40f44b6af1f903f9fc67a695195c5a6ad82d")
      ```
      Finally,run  " ```cph.keyBlockByNumber ```" to check  sync and insert action is go up.

With the database up and running, try out these commands
---

#### 1. cph.txBlockNumber

#### 2. personal.newAccount("cypher2019xxddlllaaxxx")
Among " " your should assign one password

#### 3. net

#### 4. admin.peers

#### 5. cph.accounts
    list all the accounts
#### 6. cph.getBalance(...)
cph.getBalance("0x2dbde7263aaaf1286b9c41b1138191e178cb2fd4")
   The string of “ 0x2dbde7263aaaf1286b9c41b1138191e178cb2fd4” is your wallet account.
This	wallet account string you shoud copy and store it when you executiong comand
 “ personal.newAccount(...) “; also your can using command “ cph.accounts ” to find if from  serveal acccounts.

Txpool
--
#### 1.txpool.status

#### 2.txpool.content
 all transactions in your nodes database and memory


Manual send transaction demonstration
--
#### 1.Guarantee you have two account
check this through “cph.accounts”

If you do not have,please new two accouts by using comand “ personal.newAccount() “
#### 2.check your account balance
```
 cph.getBalance("0x461f9d24b10edca41c1d9296f971c5c028e6c64c")
 cph.getBalance("0x01482d12a73186e9e0ac1421eb96381bbdcd4557")
```
#### 3.unlock your account
```
personal.unlockAccount("0x461f9d24b10edca41c1d9296f971c5c028e6c64c")
```
#### 4.sendTransaction
```
cph.sendTransaction({from:'461f9d24b10edca41c1d9296f971c5c028e6c64c',to: '01482d12a73186e9e0ac1421eb96381bbdcd4557', value: 1000000000000000000})
```
#### 5.wait several seconds to checkout balance
```
 cph.getBalance("0x461f9d24b10edca41c1d9296f971c5c028e6c64c")
 cph.getBalance("0x01482d12a73186e9e0ac1421eb96381bbdcd4557")
```
RUN:Operator miner functions
---
#### 1.miner.start(1, "0x2dbde7263aaaf1286b9c41b1138191e178cb2fd4")
First param 1 is for threads accord to you computer power;Second param is "0x2dbde7263aaaf1286b9c41b1138191e178cb2fd4" is your account.You must be enter your password.


#### 2.miner.status()
After miner.start(),your can check your current status or your current node role by using function for miner.status():

You will wait minimum 1 hour to check with command function for miner.status() to confirm whether your node have been promoted successfully.
If you are node accounts status is "I'm committee member, Doing consensus." or "I'm leader, Doing consensus."your account have been chosen into committee successfully:


Finally,after waiting about 1 hour you can check you account’s balance through function for cph.getBalance()
#### 3.miner.content()
you can check miner’s candidate from yourself and other nodes.


#### 4.miner.stop()
Stop the to find candidate to take part in consensus.

Current version for user
---
Current Version: CypherTestNet v1.61<br>
ChainId: 123023<br>
Update: <br>
User needs to do:```git pull``` ```./start.sh```


