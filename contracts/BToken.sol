pragma solidity ^0.8.9;

contract BToken {

    event Mint(address indexed _to, string _metadata);

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