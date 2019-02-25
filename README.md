Cypherium has just released its public testnet. This tutorial will help developers get the testnet up and running on your home computer, assign yourself a testwallet and fill that wallet with testnet Cypher coins. Remember these coins have no value. This tutorial will, however, demonstrate the speed and power of the Cypherium network. So please enjoy exploring the testnet. We’re confident it will get the community pumped for our robust release!

I. Operating system support
Cypherium is compatible with Mac, Windows, and Ubuntu operating systems.

II. Download repository
There are two methods available for users to download the repository and execute the bin. One for users who chose not to install the Cypherium, and another for those who run the git clone. Either will work, depending on your preference.
1. Download method number one — for users not instilling the git
  i. Please visit https://github.com/cypherium/CypherTestBin

  ii. Click “Download ZIP”

  iii. When the download is complete, extract the folder.

  iv. Rename the folder, “CypherTestBin.”

  vi. Next, open terminal.
  cd~/Downloads/CypherTestBin
  ls

  You will see two folders: mac is for MacOS and ubuntu16.04 for Ubuntu system.
  vii.select one folder according to your operating system
  cd mac
  or 
  cd ubuntu16.04

2. Second download method — if using git clone
i. Open the terminal and clone repository:
  git clone git@github.com:cypherium/CypherTestBin.git
  cd CypherTestBin
  ls

ii. You will see two folders: mac is for MacOS and ubuntu16.04 for Ubuntu system.
  cd mac
  or cd ubuntu16.04

III. Run the Cypher Process

 1. init database
 ./build/bin/cypher — datadir db init genesis.json
 2. ./ustart.sh

Congratulations! You have successfully started the Cypherium testnet!

IV. Troubleshooting
  If you cannot execute the bin, try the following tips
   1. Make sure you are operating on the root account of your computer. (You can do this with the command “su” and entering your password. If you have not created a root password yet, “su passwd” will help you set a password to your root account.)
   2. Execute command “sudo chmod -R 777.” when your current directory path is at “../CypherTestBin/”
   3. Execute “sudo rm -rf db” to delete the database. Then, regenerate the database by executing “./build/bin/cypher –datadir  d binit genesis.json”
   4. Execute shell "./urestart.sh" can delete database automic,and resart direct.
   
V. With the database up and running, try out these commands

  1.cph.txBlockNumber
  
  2. cph.txBlockNumber
  
  3. net
    check how many other cypher nodes have connected to my cypher node
    
  4. admin.peers
    detail of connected peer pairs with my node
    
  5. miner.content()
    work's proof detail list
    
  6. cph.accounts
    list all the accounts
    
  7. personal.newAccount
   Between the quotation marks (“ ”) assign one (1) password.

  8.cph.getBalance(...)
   cph.getBalance("0x2dbde7263aaaf1286b9c41b1138191e178cb2fd4")
   The string of “ 0x2dbde7263aaaf1286b9c41b1138191e178cb2fd4” is your wallet account.
   This	wallet account string you shoud copy and store it when you executiong comand “ personal.newAccount(...) “; also your can using command “ cph.accounts ” to find if from  serveal acccounts.

  9.Abount miner work
   Miner’work is to find a proof of work which will be called candidate according to latest parent txBlockNumber.Through finding one candidate to get the chance that can be chosen into committee as leader or member.To take part in consensus without banzantium you account will be get reward.
  a.miner.start(1, "0x2dbde7263aaaf1286b9c41b1138191e178cb2fd4")
    First param 1 is for threads accord to you computer power;Second param is "0x2dbde7263aaaf1286b9c41b1138191e178cb2fd4" is your account
  b.miner.status()
   You will wait minimum 1 hour to check with command function for miner.status() to confirm whether your node have been promoted successfully.If your node accounts status is "I'm committee member, Doing consensus." or "I'm leader, Doing consensus."your account have been chosen into committee successfully.
   Finally,after waiting about 1 hour you can check you account’s balance through function for cph.getBalance()
  c.miner.content()
   you can check miner’s candidate from yourself and other nodes.
  d.miner.stop()
    Stop the to find candidate to take part in consensus.
Ⅷ. Manual Send Transaction Demonstration

   i. Guarantee you have two account
   check this through “cph.accounts”
   If you do not have,please new two accouts by using comand “ personal.newAccount() “

   ii. check your account balance
   cph.getBalance("0x2dbde7263aaaf1286b9c41b1138191e178cb2fd4")
   cph.getBalance("0x01482d12a73186e9e0ac1421eb96381bbdcd4557")

   iii. unlock your account
   personal.unlockAccount("0x2dbde7263aaaf1286b9c41b1138191e178cb2fd4")

   iv. sendTransaction
   cph.sendTransaction({from:'0x2dbde7263aaaf1286b9c41b1138191e178cb2fd4',to: '01482d12a73186e9e0ac1421eb96381bbdcd4557', value:    1000})

   v. wait several seconds to checkout balance
    cph.getBalance("0x2dbde7263aaaf1286b9c41b1138191e178cb2fd4")
    cph.getBalance("0x01482d12a73186e9e0ac1421eb96381bbdcd4557")

