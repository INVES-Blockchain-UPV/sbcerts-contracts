pragma solidity ^0.8.9;

contract BFactory {

    event EventCreation(address indexed _event, uint256 _eventId, string _name);
    event EventCancelation(address indexed _event, uint256 _eventId, string _name);

    uint256 currentEvent;
    
    mapping(uint256 => address) events; /// event id to Btoken.sol contract  
    mapping(string => uint256)  eventsId; /// event name to id

    constructor() {
        
    }
}
