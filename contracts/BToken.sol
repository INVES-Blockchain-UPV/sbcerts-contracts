pragma solidity ^0.8.9;

contract BToken {

    event mint(address indexed _count);
    event mintBatch(address[] indexed _counts);

    uint256 startDate;
    uint256 duration;
    uint256 creationDate;
    
    string title;
    string description;
    
    mapping(address => bool) holds; ///Token has been minted
    mapping(address => string) holder;
    
    constructor() {
        
    }
}
