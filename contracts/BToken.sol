pragma solidity ^0.8.9;

contract BToken {

    event Mint(address indexed _to, string _metadata);

    uint256 private _startDate;
    uint256 private _duration;
    uint256 private _creationDate;
    
    string private _title;
    string private _description;
    string private _url;

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

    //Possible metadata format: Perico, Juan
    function mint(address to, string calldata metadata) private onlyOwner() {
        _mint(to, metadata);
    }
    
    function mintBatch(address[] calldata holders, string[] calldata metadata) public onlyOwner() {
        uint256 length = holders.length;
        require(length == metadata.length, "Wrong Batch");
        for(uint256 i; i < length;) {
          _mint(holders[i], metadata[i]);        
          unchecked {
            ++i;
           }
        }
    }
    
    function _mint(address to, string memory metadata) private {
        _holds[to] = true;
        _holder[to] = metadata;
        emit Mint(to, metadata);
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

    function startDate() public view returns (uint256){
        return _startDate;
    }

    function duration() public view returns (uint256){
        return _duration;
    }

    function creationDate() public view returns (uint256){
        return _creationDate;
    }

    function isOwner(address _address) public returns (bool memory){
        return _holds[address];
    }
}
