<h1 align="center">Projeto - Avaliação de pontos turísticos usando a tecnologia Blockchain</h1>

Aprenda como desenvolver uma aplicação descentralizada (DApp) utilizando as tecnologias Truffle, Ganache, Metamask, Web3js e React.

Abaixo o Roadmap que ilustra as etapas do projeto.

<img src="Roadmap2.jpg" alt="roadmap" width="800" height="450">

No projeto, criaremos um smart contract em solidity e faremos o deploy dele pelo Truffle, o deploy será na Blockchain criada pelo Ganache.
Utilizaremos o Metamask para fazer a comunicação com a Blockchain e o React para criar a interface web da aplicação. 

A aplicação vai simular um sistema de avaliação de pontos turísticos, onde qualquer usuário poderá cadastrar um novo ponto turístico usando como base a localização no google maps. Na avaliação o usuário deverá considerar alguns aspectos como paisagem, preço, segurança, acessibilidade, um breve resumo da experiência e por fim se recomenda ou não a visita.


## Deploy do Smart Contract

Para o deploy do projeto será necessário instalar o Visual Studio Code(link), Truffle(link), Ganache(link) e baixar o smart contract.
Você pode encontrar a pasta **projeto-trip** contendo o smart contract com o nome de _viagem.sol_ nesse link. 

Para iniciar o projeto precisamos fazer o deploy do smart contract, siga os passos abaixo no terminal:

- 1º Inicie o Ganache:
```
ganache-cli
```
- 2º Crie uma pasta para o projeto:
```
mkdir trip-rating
```
- 3º Entre no diretório criado:
```
cd trip-rating
```
- 4º No diretório **trip-rating** inicialize o truffle:
```
truffle init
```
- 5º Abra a pasta **trip-rating** no Visual Studio Code

Note que o truffle criou algumas pastas, seu diretório deve estar assim:
<img src="print1.png" alt="print1">

- 6º Coloque o smart contract _viagem.sol_ dentro da pasta **contracts**
- 7º Voltando ao terminal, execute o comando:
```
truffle compile
```

Note que o truffle criou uma pasta chamada **build**, dentro dela tem 2 arquivos JSON: 


- 8º Crie um arquivo para o deploy dentro da pasta **migrations**, coloque o nome de _2_deploy_contract.js_
- 9º No arquivo _2_deploy_contract.js_ cole o código abaixo:
```
const Viagem = artifacts.require('../contracts/viagem.sol');
module.exports = function(deployer) {
     deployer.deploy(Viagem);
}
```
- 10º No arquivo _truffle-config.js_ cole o código abaixo:
```
module.exports = {
    networks: {
       development: {
          host: "127.0.0.1",
          port: 7545, // Porta padrão em que o ganache utiliza
          network_id: "*"
       }
    }, 
    solc: {
       optimizer: {
          enabled: true,
          runs: 200
       }
    }
}
```
- 11º No terminal, execute o comando:
```
truffle migrate
```

Se ocorrer tudo certo, receberemos o log abaixo no terminal:






Parabéns, você fez o deploy do smart contract

Agora precisamos confirmar se a transação foi gravada no Ganache. Abra a aba Transactions e verifique se a transação foi registrada:






## Instanciando Web3js

Abra o arquivo _app.js_ no diretório **projeto-trip/src/** e faça as seguintes alterações:






