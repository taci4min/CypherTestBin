Cypherium Testnet Tutorial
===
Cypherium has just released its public testnet. This tutorial will help developers get the testnet up and running on your home computer,
 assign yourself a testwallet and fill that wallet with testnet Cypher coins. Remember these coins have no value. This tutorial will, however,
 demonstrate the speed and power of the Cypherium network. So please enjoy exploring the testnet. We’re confident it will get the community pumped for our robust release

Operating system support
---
Cypherium is compatible with Mac, Windows, and Linux operating systems.

Public IP for VPS needed
--
Your ip of your machine or VPS which used to deploy cypher node  must be `public IP`.such AWS ec2 which has `public IP` to deploy your cypher node!
Please open 18002,16002,30301,7000 ports for UDP and TCP rule for VPS.Maybe you also need to shut firewalld.service by using command `systemctl stop firewalld.service`

Download repository
---
There are two methods available for users to download the repository and execute the bin. One for users who chose not to install the Cypherium, 
and another for those who run the git clone. Either will work, depending on your preference.
* #### Download method number one — for users not installing the git
  ##### 1. Please visit https://github.com/cypherium/CypherTestBin

  ##### 2. Click “Download ZIP”

  ##### 3. When the download is complete, extract the folder.

  ##### 4. Rename the folder, “CypherTestBin.”

  ##### 5. Next, open terminal.
  ```
  cd ~/Downloads/CypherTestBin
  ls
  ```
  You will see two folders: mac is for MacOS and linux for Linux system.
  ##### vii.select one folder according to your operating system
  ```
  cd mac
  ```
  or
  
  ``` 
  cd linux
  ```
* #### Second download method — if using git clone

 #### 1. Open the terminal and clone repository:
 ```
  git clone git@github.com:cypherium/CypherTestBin.git
  cd CypherTestBin
  ls
 ```
 #### 2. You will see two folders: `mac` is for MacOS and `linux` for Linux system.
 ```
  cd mac
```
  or
```
  cd linux
 ```
 Run the Cypher Process
 ---

 #### init database
 ```
 ./ustart.sh
 ```
Congratulations! You have successfully started the Cypherium testnet!

Troubleshooting
---
  If you cannot execute the bin, try the following tips
   *  Make sure you are operating on the root account of your computer. (You can do this with the command “su” and entering your password.
   If you have not created a root password yet, “su passwd” will help you set a password to your root account.)
   * Execute command “sudo chmod -R 777.” when your current directory path is at “../CypherTestBin/”
   * Execute “sudo rm -rf chaindb” to delete the database. Then, regenerate the database by executing “./cypher -–datadir chaindb  init ../genesis.json”
   * Execute shell "./urestart.sh" can delete database automic,and restart directly.As soon as you finding the chainId is different from previous chaindId which is checked through executing
     command "net",you should execute shell "./urestart.sh" to restart one new block chain for cypher.

With the database up and running, try out these commands
---

#### 1. cph.txBlockNumber

#### 2. personal.newAccount("1")
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


Manual Send Transaction Demonstration
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
cph.sendTransaction({from:'461f9d24b10edca41c1d9296f971c5c028e6c64c',to: '01482d12a73186e9e0ac1421eb96381bbdcd4557', value: 1000})
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
e

Finally,after waiting about 1 hour you can check you account’s balance through function for cph.getBalance()
#### 3.miner.content()
you can check miner’s candidate from yourself and other nodes.


#### 4.miner.stop()
Stop the to find candidate to take part in consensus.

