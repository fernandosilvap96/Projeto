<h1 align="center">Projeto - Avaliação de pontos turísticos usando a tecnologia Blockchain</h1>

Aprenda como desenvolver uma aplicação descentralizada (DApp) utilizando as tecnologias Truffle, Ganache, Metamask, Web3js e React.

Abaixo o Roadmap que ilustra as etapas do projeto.

<img src="roadmap.jpg" alt="roadmap" width="800" height="450">

No projeto, criaremos um smart contract em solidity e faremos o deploy dele pelo Truffle, o deploy será na Blockchain criada pelo Ganache.
Utilizaremos o Metamask para fazer a comunicação com a Blockchain e o React para criar a interface web da aplicação. 

A aplicação vai simular um sistema de avaliação de pontos turísticos, onde qualquer usuário poderá cadastrar um novo ponto turístico usando como base a localização no google maps. Na avaliação o usuário deverá considerar alguns aspectos como paisagem, preço, segurança, acessibilidade, um breve resumo da experiência e por fim se recomenda ou não a visita.


## Deploy do Smart Contract

Para o deploy do projeto será necessário instalar o Visual Studio Code(link), Truffle(link), Ganache(link) e baixar o smart contract.
Você pode encontrar a pasta **projeto-trip** contendo o smart contract com o nome de _trip.sol_ nesse link. 

Para iniciar o projeto precisamos fazer o deploy do smart contract, siga os passos abaixo no terminal:

- 1º Passo:
Inicie o Ganache: ``ganache-cli``

- 2º Passo:
Crie uma pasta para o projeto: ``mkdir trip-rating``

- 3º Passo:
Entre no diretório criado: ``cd trip-rating``

- 4º Passo:
No diretório **trip-rating** inicialize o truffle: ``truffle init``

- 5º Passo:
Abra a pasta **trip-rating** no Visual Studio Code

Note que o truffle criou algumas pastas, seu diretório deve estar assim:


- 6º Passo:
Coloque o smart contract _trip.sol_ dentro da pasta contracts

- 7º Passo:
Voltando ao terminal, execute o comando: ``truffle compile``

Note que o truffle criou uma pasta chamada **build**, dentro dela tem 2 arquivos JSON: 


- 8º Passo:
Crie um arquivo para o deploy dentro da pasta **migrations**, coloque o nome de _2_deploy_contract.js_

- 9º Passo:
No arquivo _2_deploy_contract.js_ cole o código abaixo:

```
const Trip = artifacts.require('../contracts/trip.sol');
module.exports = function(deployer) {
     deployer.deploy(Trip);
}
```

- 10º Passo:
No arquivo _truffle-config.js_ cole o código abaixo:

```
module.exports = {
    networks: {
       development: {
          host: "127.0.0.1",
          port: 8545, // Porta padrão em que o ganache utiliza
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

- 11º Passo:
No terminal, execute o comando: ``truffle migrate``

Se ocorrer tudo certo, receberemos o log abaixo no terminal:






Parabéns, você fez o deploy do smart contract

Agora precisamos confirmar se a transação foi gravada no Ganache. Abra a aba Transactions e verifique se a transação foi registrada:









Precisamos criar a interação do back-end com o front-end, para isso copie o endereço do campo CREATED CONTRACT ADDRESS do Ganache, pois vamos precisar informar esse endereço dentro do React. Vamos precisar também copiar o ABI gerado do deploy que realizamos pelo truffle.










## Configuração da aplicação Web

O código com o projeto React está dentro arquivo **trip-rating**, Para instalar as dependências do _package.json_ será necessário navegar até o diretório do projeto pelo terminal e digitar o comando:
``
npm install
``

Antes de executar o comando nós precisamos modificar alguns arquvios dentro de src/app, no diretório **blockchain** teremos os arquivos _contractABI.json_ e o _web3.service.ts_, os dois arquivos que precisamos modificar. 

Abra o arquivo _contractABI.json_, apague todas as informações contidas e cole o código ABI do deploy que você realizou no Remix. A outra alteração que precisamos fazer, está no arquivo _web3.service.ts_. Na linha 16, onde tivermos  private contractAddress = "0xAc17AF58D1F9f5D79bb8816bf5238DF4A920ef33", você vai substituir esse valor, pelo que foi gerado no campo CREATED CONTRACT ADDRESS na transaction do Ganache.

Após realizar as alterações acima, execute o comando ``npm install``

Agora use o comando ``npm start``

Com a aplicação web realizada, copie o link da porta onde está nossa aplicação: <a href="http://localhost:4200">http://localhost:4200</a> e cole no navegador.

## Metamask e interações Web

Precisamos copiar a chave privada de duas contas no Ganache, e então ao importarmos uma conta no 
Metamask, vamos informar essa chave privada.

Faça isso pelo menos uma ou duas vezes com novas contas, para que você possa 
conseguir interagir entre diferentes contas na aplicação. Em nosso ambiente, fizemos a 
importação de duas contas.

Certificando de que as contas importadas estão com Ethereum, podemos executar a 
aplicação no nosso navegador e fazer a interação com o Smart Contract. Ao executar a 
aplicação teremos poucas informações, pois não fizemos interação nenhuma com a Blockchain 
ainda. Podemos começar adicionando um livro. Precisamos informar algumas informações: o 
nome do livro, uma url para a imagem do livro e a categoria do livro. Após clicar em Cadastrar.






