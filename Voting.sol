// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract VotingContract {
    
    event RegesteringCandidate(uint256 candidate_id,  string name, uint256 total_vote);
    event Voted(uint256 id);
    event Fight(string fighter1, string fighter2);
    
    
    struct Candidate {
        string name;
        uint256 id;
        uint256 voteCount;
        string image;
    }
    
    
    mapping(address => bool) public voters;
    mapping(uint => Candidate) public candidates;
    
    uint256 public candidatesCount;
    
    modifier alreadyVoted(){
        require(voters[msg.sender] ==  false, 'The vote has already been casted');
        _;
    }
    
     function addCandidate(string memory _name, string memory _image) public {
        require(bytes(_name).length > 0, "Empty Name");
        candidates[candidatesCount] = Candidate(_name, candidatesCount, 0, _image);
        candidatesCount++;
        emit RegesteringCandidate(candidatesCount, _name, candidates[candidatesCount - 1].voteCount );
    }
    
    function addVote(uint256 _id) public alreadyVoted(){
        require(_id >= 0 && _id < candidatesCount, "Invalid option");
        voters[msg.sender] = true;
        candidates[_id].voteCount++;
        emit Voted(_id);
        // ,Candidates[_id].vote_count
    }
    
    function fighter1(string memory name, uint256 max_votes) public {

        
        for(uint256 i=0; i< candidatesCount; i++){
            if(max_votes < candidates[i].voteCount){
                max_votes = candidates[i].voteCount;
                name = candidates[i].name;
            }
            
        }
    }
    
    function fighter2(string memory name, uint256 max_votes) public {

        
        for(uint256 i=0; i< candidatesCount; i++) {
            if(max_votes < candidates[i].voteCount) {
                max_votes = candidates[i - 1].voteCount;
                name = candidates[i - 1].name;
            }
        }
    }
    
    function fight(string memory fighter1, string memory fighter2) public {
        
        fighter1 = fighter1;
        fighter2 = fighter2;
        
        emit Fight(fighter1, fighter2);
    }
    
    
    
    

    
    
    
}   
