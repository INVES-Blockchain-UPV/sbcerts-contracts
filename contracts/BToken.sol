pragma solidity ^0.8.9;

contract BToken {

    event Mint(address indexed _to, string _metadata);

    uint256 _startDate;
    uint256 _duration;
    uint256 _creationDate;
    
    string _title;
    string _description;
    string _url;

    address _owner;

    mapping(address => bool) _holds; ///Token has been minted
    mapping(address => string) _holder;
    
    constructor(string memory title, string memory description, uint256 startDate, uint256 duration,string memory url) {

        _title = title;
        _description = description;
        _creationDate = block.timestamp;
        _startDate = startDate;
        _duration = duration;
        _url = url;
        _owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == _owner);
        _;
    }

    //Possible metadata format: Perico,Juan
    function mint(address to, string memory metadata) public onlyOwner() {
    }

    function title() public view returns (string memory){
        return _title;
    }

    function description() public view returns (string memory){
        return _description;

    }

    function tokenURl() public view returns (string memory){
        return _url;
    }

    function isOwner(address _address) public returns (bool memory){
        //Necessary instead of initialise all bools in map to false (more expensive)
        if(_holds[_address] == true)return true;
        else return false;
    }




}
