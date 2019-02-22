pragma solidity >=0.4.22 <0.6.0;

contract marriage {
    address public person1;
    address public person2;

    bool public mariageAccepted = false;
    uint256 public marriageDate;

    // Divorce
    bool public divorced = false;
    bool public divorcedRequested = false;

    address public divorceRequestedBy;
    address public divorceRequestTo;
    
    bool public divorceAccepted;
    uint256 public divorcedDate;

    constructor() public{
        person1 = msg.sender;
    }

    function mariageRequest(address _person2) public {
        if (msg.sender == person1){
            person2 = _person2;
        }
    }

    function mariageAccept() public returns (string memory) {
        if (msg.sender == person2 && mariageAccepted == false){
                mariageAccepted = true;
                marriageDate = now;
                return "Accepted";
        }
    }
    
    function marriagestatus() public view returns (string memory){
        if (mariageAccepted == true && divorced == false){
            return "They are married";
        }
        if (mariageAccepted == false){
            return "They are not married";
        }
    }
    
    function divorceRequest(address _to) public {
        if (_to == person1 || _to == person2){
            if (mariageAccepted == true){
                divorcedRequested = true;
                divorceRequestTo = _to;
                divorceRequestedBy = msg.sender;
            }
        }
    }
    
    function divorceRequestCancel() public{
        if (divorceRequestedBy == msg.sender && divorceAccepted == false){
            divorcedRequested = false;
        }
    }
    
    function divorceAccept() public{
        if (msg.sender == divorceRequestTo){
            divorceAccepted = true;
            divorced = true;
            divorcedDate = now;

        }
    }
}