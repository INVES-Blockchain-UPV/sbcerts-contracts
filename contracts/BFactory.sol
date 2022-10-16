pragma solidity ^0.8.9;

contract BFactory {

    uint256 currentEvent;
    
    mapping(uint256 => address) events; /// event id to Btoken.sol contract  
    mapping(string => uint256)  eventsId; /// event name to id

    constructor() {
        
    }
}
