pragma solidity ^0.8.9;

contract BFactory {

    uint256 id;
    mapping(uint256 => address) addressCharla; ///id to address contract "charla"
    mapping(string => uint256)  idCharla; /// name charla to id

    constructor() {
        
    }
}