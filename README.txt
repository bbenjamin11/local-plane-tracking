
-----------------------------------
---	Deployed SM		---
-----------------------------------
1 : GO ON VP0
	>docker exec -it pbft_vp0_1 bash

2 : IN YOUR PEER DEPLOYED YOUR CHAINCODE
	root@vp0:/opt/gopath/src/github.com/hyperledger/fabric# peer chaincode deploy -p "https://github.com/bbenjamin11/chaincode-plane-tracking" -c '{"Function":"init","Args":[]}'


3 : IN THE RESULT, GET THE "DEPLOYED CHAINCODE" NAME
	Deploy chaincode
	d3f9d72b4ef3cbbe0f7989bc9e7a9493fc0bbd619d25daa919510edd965f33902d950043267a012b52ea3cc228ead2563ab437ac2500b6bc6375fc6c999fe69d

4 : COPIE THE NAME IN OUR SERVER OPTION.JSON
	Open : C:\Users\BlockchainHF06\web-plane-tracking\option.json
	Replace : chaincode.deploey_name by your previously chaincode name

-----------------------------------
---	Configur server		---
-----------------------------------
1 : GET OUR IP NETWORK (in local) 
	- on windos : cmd -> ipconfig
	- on linux : terminal -> ifconfig

2 : COPIE THE IP IN OUR SERVER SETUP.JSON
	-Open : C:\Users\BlockchainHF06\web-plane-tracking\setup.json
	-Replace hostname with your IP
	-Chose your port

-----------------------------------
---	Launch App		---
-----------------------------------

1 : STOP ALL YOUR CONTAINERS
	> docker stop pbft_vp0_1
	pbft_vp0_1
	> docker stop pbft_vp1_1
	pbft_vp1_1
	> docker stop pbft_vp2_1
	pbft_vp2_1
	> docker stop pbft_vp3_1
	pbft_vp3_1

2 : START ALL YOUR CONTAINERS
	> docker start pbft_vp0_1
	pbft_vp0_1
	> docker start pbft_vp1_1
	pbft_vp1_1
	> docker start pbft_vp2_1
	pbft_vp2_1
	> docker start pbft_vp3_1
	pbft_vp3_1

3 : LAUNCH THE SERVER
	> cd C:\Users\BlockchainHF06\web-plane-tracking
	> node .\app.js
	Server Up - 192.168.43.48:8080
	Websocket Up
	[ibc-js] Chain Stats - success
