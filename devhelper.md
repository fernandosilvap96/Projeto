##Web3js##

Methods:

getAccount()
example: web3.eth.getAccounts()

getBlockNumber()
web3.eth.getBlockNumber()

getBalance()
web3.eth.getBalance()

##Provider##

var Web3 = require('web3');
var web3 = new Web3(Web3.givenProvider || 'ws://some.local-or-remote.node:8546');

ou 

web3.setProvider(new web3.providers.HttpProvider('http://localhost:7545'))

Para saber o provider que o usuario está interagindo, digitar:

web3.currentProvider

##Promises with We3js##

Serve para obter os dados da blockchain

return new Promise (function (resolve, reject) {
  we3.eth.getBalance("0xa589...", function (error, balance) {
    if (error) {
      reject(error)
    } else {
      resolve(balance)
    }
  })
}  



https://www.dappuniversity.com/articles/ethereum-dapp-react-tutorial
