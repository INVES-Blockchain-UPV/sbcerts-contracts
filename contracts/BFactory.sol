pragma solidity ^0.8.9;

contract BFactory {

    event createEvent(address indexed _event, uint256 _currentEvent, string _name);
    event removeEvent(address indexed _event, uint256 _eventid);

    uint256 currentEvent;
    
    mapping(uint256 => address) events; /// event id to Btoken.sol contract  
    mapping(string => uint256)  eventsId; /// event name to id

    constructor() {
        
    }
}
