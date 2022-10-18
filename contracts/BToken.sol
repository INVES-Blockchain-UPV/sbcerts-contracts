pragma solidity ^0.8.9;

contract BToken {

    event Mint(address indexed _to, string _metadata);

    uint256 startDate;
    uint256 duration;
    uint256 creationDate;
    
    string title;
    string description;
    
    address owner;

    mapping(address => bool) holds; ///Token has been minted
    mapping(address => string) holder;
    
    constructor(string memory _title, string memory _description, uint256 _startDate, uint256 _duration) {

        title = _title;
        description = _description;
        creationDate = block.timestamp;
        startDate = _startDate;
        duration = _duration;
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    function mint(address to_, string memory _metadata) public onlyOwner() {

    }


}
