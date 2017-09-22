# Local-plane-tracking
## BlockChain for the SupplyChain
-------------------------------------------
## Prerequisites
* [Docker](https://www.docker.com/) - Build, Ship, and Run Any App, Anywhere
   - Run Docker For Windows.exe
* [node.js](https://nodejs.org/en/) - evented I/O for the backend
------------------------------------
## Installation and configuration
##### BlockChain
Go to PowerShell .
Install hyperledger images .
```sh
> docker pull hyperledger/fabric-peer:x86_64-0.6.1-preview
> docker pull hyperledger/fabric-membersrvc:x86_64-0.6.1-preview
> docker pull yeasy/blockchain-explorer:latest
```
Create Docker tags.
```sh
> docker tag hyperledger/fabric-peer:x86_64-0.6.1-preview hyperledger/fabric-peer
> docker tag hyperledger/fabric-peer:x86_64-0.6.1-preview hyperledger/fabric-baseimage
> docker tag hyperledger/fabric-membersrvc:x86_64-0.6.1-preview hyperledger/fabric-membersrvc
```
Launch Blockchain.
```sh
> cd local-plane-tracking\docker-compose-file
> docker-compose -f 4-peers.yml up
```
=> Do not kill the PowerShell window, open a new PowerShell to continue.
On the new PowerShell window go on your blockchain virtual environment.
```sh
> docker exec -it dockerhyperledger06_vp0_1 bash
```
You are now on virtual environment.
Deploy the chaincode :

```sh
root@vp0:/opt/gopath/src/github.com/hyperledger/fabric# peer chaincode deploy -p "https://github.com/bbenjamin11/chaincode-plane-tracking" -c '{"Function":"init","Args":[]}'
```
**In the result, get and save the "deployed chaincode" name :**
Deploy chaincode
d3f9d72b4ef3cbbe0f7989bc9e7a9493fc0bbd619d25daa919510edd965f33902d950043267a012b52ea3cc228ead2563ab437ac2500b6bc6375fc6c999fe69d

##### Server
Copy the chaincode name in your server file option.json :
--	Open : local-plane-tracking\option.json
--	Replace : chaincode.deploey_name by your current chaincode name

Config the ip adress :
--Get yout adress ip in your local network
```sh
> ipconfig
```
-- Copy the ip adress in your server file setup.json
* Open : local-plane-tracking\setup.json
* Replace hostname with your IP
* Chose your port

-----------------------------------
## Run the app

Before the first launch install the npm package
```sh
	> cd local-plane-tracking
	> npm install -i
```
Launch the server
```sh
	> cd local-plane-tracking
	> node .\app.js
	Server Up - 192.168.43.48:8080
	Websocket Up
	[ibc-js] Chain Stats - success
```

**Your app is running !**
You can go on your browser and tape : your_adress_ip:your_port (192.168.43.48:8080 for example).

Each time yout computer restart you will have to launch the server again (the blockchain docker VM is strating automaticaly).

If the server failed to launch restart the blockchain docker VM :
* Stop all your Docker containers.
```sh
	> docker stop dockerhyperledger06_vp0_1
	> docker stop dockerhyperledger06_vp1_1
	> docker stop dockerhyperledger06_vp2_1
	> docker stop dockerhyperledger06_vp3_1
```
* Start all your Docker containers.
```sh
	> docker start dockerhyperledger06_vp0_1
	> docker start dockerhyperledger06_vp1_1
	> docker start dockerhyperledger06_vp2_1
	> docker start dockerhyperledger06_vp3_1
```
* Launch your server again.
