pragma solidity ^0.8.9;

import "./BToken.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract BFactory {

    event eventCreated(address indexed _event, uint256 _currentEvent, string _name);
    event removeEvent(address indexed _event, uint256 _eventid);

    uint256 currentEvent;
    
    mapping(uint256 => address) events; /// event id to Btoken.sol contract  
    mapping(string => uint256)  eventsId; /// event name to id

    constructor() {
        currentEvent = 1;
    }

    
    function createEvent(
        address _events,
        string memory _startDate,
        uint256 _duration,
        string memory _title,
        string memory _description
    ) public  {
    
    }  
    
}
