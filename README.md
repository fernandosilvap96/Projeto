<h1 align="center">Projeto - Avaliação de pontos turísticos usando a tecnologia Blockchain</h1>

Aprenda como desenvolver uma aplicação descentralizada (DApp) utilizando 
a as tecnologias Solidity, Ganache, Metamask, Web3js e React. 

Abaixo o Roadmap que ilustra as etapas do projeto.

<img src="roadmap.jpg" alt="roadmap" width="1100" height="550">

No projeto, criaremos um smart contract em solidity e faremos o deploy dele pelo IDE REMIX, o deploy será na Blockchain criada pelo Ganache.
Utilizaremos o Metamask para fazer a comunicação com a Blockchain e o React para criar a interface web da aplicação. 

A aplicação vai simular um sistema de avaliação de pontos turísticos, onde qualquer usuário poderá cadastrar um novo ponto turístico usando como base a localização no google maps. Na avaliação o usuário deverá considerar alguns aspectos como paisagem, preço, segurança, acessibilidade, um breve resumo da experiência e por fim se recomenda ou não a visita.


## Deploy do Smart Contract

Você pode encontrar o arquivo **trip-rating** contendo o smart contract nesse link. 

Para iniciar o projeto precisamos dar deploy do smart contract obtido acima, primeiro acesse o site do IDE Remix por esse link.

- 1º Passo:
No IDE REMIX crie um novo arquivo e nomeie-o de _rating.sol_

- 2º Passo:
Copie o conteudo do arquivo _smartcontract.sol_ dentro da pasta **trip-rating** e então cole no arquivo _rating.sol_ criado no IDE REMIX.

No menu do lado esquerdo, você terá a opção de compilação.
Deixe o menu configurado conforme abaixo:




Antes de clicar em deploy precisamos fazer alguns ajustes, primeiro abra o Ganache e clique em Quickstart Blockchain:





