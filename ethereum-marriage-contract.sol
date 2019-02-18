pragma solidity >=0.4.22 <0.6.0;

contract marriage {
    address public person1;
    address public person2;
    
    bool public accepted;
    uint256 public MarriageDate;

    constructor() public{
        person1 = msg.sender;
    }

    function request(address _person2) public {
        if (msg.sender == person1){
            person2 = _person2;
        }
    }

    function marriagestatus() public view returns (string memory){
        if (accepted){
            return "They are married";
        }
        else{
            return "They are not married"
        }
    }
    function accept() public returns (string memory) {
        if (msg.sender == person2 && accepted == false){
                accepted = true;
                MarriageDate = now;
                return "Accepted";
            }
        }
    }
