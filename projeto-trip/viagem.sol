pragma solidity ^0.6.0;

contract ViagemContract {
    
    struct Viagem {
        uint256 id;
        string nome;
        string imagem;
        uint64[] votes;
        string lugar;
        bytes32[] options;
        
    }
    
    struct Voter {
        address id;
        uint256[] voteIds;
        mapping(uint256 => bool) votedMap;
    }
    
    Viagem[] private viagens;
    
    mapping(address => Voter) private voters;
    
    event ViagemCreated(uint256 _viagemId); 
    
     function createViagem(string memory _nome, string memory _imagem, string memory _lugar, bytes32[] memory _options) public {
        require(bytes(_nome).length > 0, "Empty Name");
        
        uint256 viagemId = viagens.length;
        
        Viagem memory newViagem = Viagem({
            id: viagemId,
            nome: _nome,
            imagem: _imagem,
            lugar: _lugar,
            options: _options,
            votes: new uint64[](_options.length)
        });
        
        viagens.push(newViagem);
        emit ViagemCreated(viagemId);
    }
    
     function getViagem(uint256 _viagemId) external view returns(uint256, string memory, string memory, string memory, uint64[] memory, bytes32[] memory) {
        require(_viagemId < viagens.length && _viagemId >= 0, "No book found");
        return (
            viagens[_viagemId].id,
            viagens[_viagemId].nome,
            viagens[_viagemId].imagem,
            viagens[_viagemId].lugar,
            viagens[_viagemId].votes,
            viagens[_viagemId].options
        );
    }
    
    function vote(uint256 _viagemId, uint64 _vote) external {
        require(_viagemId < viagens.length, "Place does not exists");
        require(_vote < viagens[_viagemId].options.length, "Invalid vote");
        require(voters[msg.sender].votedMap[_viagemId] == false, "You already voted");
        
        viagens[_viagemId].votes[_vote] += 1;
        
        voters[msg.sender].voteIds.push(_viagemId); 
        voters[msg.sender].votedMap[_viagemId] = true; 
        
        uint256 viagemId = viagens.length;
        
    }
    
    function getVoter(address _id) external view returns (address, uint256[] memory){
        return (
            voters[_id].id,
            voters[_id].voteIds
        );
    }
    
    function getTotalViagens() external view returns(uint256) {
        return viagens.length;
    }
}