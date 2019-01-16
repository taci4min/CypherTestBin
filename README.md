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

v. Next, open terminal.
· For Mac Users:


· For Ubuntu Users:
Single click the right button of your mouse and select “open terminal.”
vi. Visit CypherTestBin folder.
cd~/Downloads/CypherTestBin
ls

You will see two folders: mac is for MacOS and ubuntu16.04 for Ubuntu system.
cd mac
Or cd ubuntu16.04

2. Second download method — if using git clone
i. Open the terminal and clone repository:
git clone git@github.com:cypherium/CypherTestBin.git

cd CypherTestBin
ls

ii. You will see two folders: mac is for MacOS and ubuntu16.04 for Ubuntu system.
cd mac
Or cd ubuntu16.04

III. Run the Cypher Process
1. init database
./build/bin/cypher — datadir db init genesis.json
2. ./ustart.sh

Congratulations! You have successfully started the Cypherium testnet!

IV. Troubleshooting
If you cannot execute the bin, try the following tips
1. Make sure you are operating on the root account of your computer. (You can do this with the command “su” and entering your password. If you have not created a root password yet, “su passwd” will help you set a password to your root account.)
2. Execute command “sudo chmod -R 777.” when your current directory path is at “../CypherTestBin/”
3. Execute “sudo rm -rf db” to delete the database. Then, regenerate the database by executing “./build/bin/cypher –datadir d binit genesis.json”
V. With the database up and running, try out these commands
cph.keyBlockNumber()

2. cph.txBlockNumber

3. personal.newAccount
Between the quotation marks (“ ”) assign one (1) password.

4. cph.getBalance(…)
i. cph.getBalance(“0x2dbde7263aaaf1286b9c41b1138191e178cb2fd4”)
ii. Here, the string of (“0x2dbde7263aaaf1286b9c41b1138191e178cb2fd4”) is your wallet’s public key. Copy and store it when you’re executing the command “personal.newAccount(…)”; or the command “cph.accounts” to list all accounts.

VI. Okay, so now let’s have some real fun: assign testnet cypher coins to your account.
First, exit the current process

2. Edit genesis.json by using textEdit.app or “vi genesis.json”

3. Find this section of text and replace the account number with your own.

4. After plugging in your wallet, store it.

5. Delete the folder name db/cypher or execution command “sudo rm -rf db/cypher”

6. Reinit database
.build/bin/cypher –datadir d binit genesis.json
7. Restart process
./ustart.sh

8. Have a fun journey of execution commands
i. Personal.unlockAll(“1”)

ii. cph.autoTransaction(1,10)

iii. Stop auto transaction
cph.autoTransaction(0,10)

iv. Txpool.content

v. net

vi. Admin.peers

vii. miner.content()
