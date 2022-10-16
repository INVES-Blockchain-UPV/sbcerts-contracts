pragma solidity ^0.8.9;

contract BToken {

    uint256 startDate;
    string tittle;
    string description;
    mapping(address => bool) holder; ///Token has been minted
    constructor() {
        
    }
}