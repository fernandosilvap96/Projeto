pragma solidity ^0.6.0;

contract VotingContract {
    
    struct Option {
        uint256 id;
        string nome;
        string imagem;
        uint64 votes;
        
    }
    
    struct Voter {
        address id;
        uint256 voteIds;
        mapping(uint256 => bool) votedMap;
    }
    
    Option[] private options;
    
    mapping(address => Voter) private voters;
    
    event OptionCreated(uint256 _candidatoId); 
    
     function createOption(string memory _nome, string memory _imagem) public {
        require(bytes(_nome).length > 0, "Empty Name");
        
        uint256 optionId = options.length;
        
        Option memory newOption = Option({
            id: optionId,
            nome: _nome,
            imagem: _imagem,
            votes: new uint64
        });
        
        options.push(newOption);
        emit OptionCreated(optionId);
    }
    
     function getOption(uint256 _optionId) external view returns(uint256, string memory, string memory, uint64 memory) {
        require(_optionId < options.length && _optionId >= 0, "Opção não encontrada");
        return (
            options[_optionId].id,
            options[_optionId].nome,
            options[_optionId].imagem,
            options[_optionId].votes,
        );
    }
    
    function vote(uint64 _vote) external {
       	require(_optionId < options.length, "Opção não existe");
        require(_vote < options[_optionId], "Voto inválido");
        require(voters[msg.sender].votedMap[_optionId] == false, "Você já votou");
        
        options[_optionId].votes[_vote] += 1;
        
        voters[msg.sender].voteIds.push(_optionId); 
        voters[msg.sender].votedMap[_optionId] = true; 
        
        uint256 optionId = options.length;
        
    }
    
    function getVoter(address _id) external view returns (address, uint256[] memory){
        return (
            voters[_id].id,
            voters[_id].voteIds
        );
    }
    
    function getTotalOptions() external view returns(uint256) {
        return options.length;
    }
}