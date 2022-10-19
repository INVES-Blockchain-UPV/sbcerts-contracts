pragma solidity ^0.8.9;

import "./BToken.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract BFactory is Initializable, UUPSUpgradeable, OwnableUpgradeable{
    
    event EventCreation(address indexed _event, uint256 _eventId, string _name);
    event EventCancelation(address indexed _event, uint256 _eventId, string _name);

    uint256 currentEvent;
    
    mapping(uint256 => address) events; /// event id to Btoken.sol contract  
    mapping(string => uint256)  eventsId; /// event name to id

    function initialize() public initializer {
        currentEvent = 1;
         ///@dev no constructor -> initialise the OwnableUpgradeable explicitly
        __Ownable_init();
    }

    ///@dev required by the OZ UUPS module
    function _authorizeUpgrade(address) internal override onlyOwner {}
    
    function createEvent(
        address _events, // can be eliminated?
        uint256 _startDate, 
        uint256 _duration,
        string memory _title,
        string memory _description
    ) public  onlyOwner{
        require(_events != address(0x0));
        require(eventsId[_title] == 0, "This name already exist");
        require( bytes(_title).length > 0 && bytes(_title).length < 20, "Name invalid!");
        require( bytes(_description).length > 40 && bytes(_description).length > 40, "Description must be 40-200 characters!");
        require(_duration > 300, "Minimum time votation 5 minutes");
        require(_startDate > block.timestamp, "Start date not valid");

        BToken myEvent = new BToken(
            _startDate,
            _duration,
            block.timestamp, //creationDate in Btoken
            _title,
            _description
        );

        eventsId[_title] = currentEvent;
        events[currentEvent] = _events;
        ++currentEvent;

        emit EventCreation(_events, eventsId[_title], _title); //address(myEvent)
    } 

    function getEvents(uint256 _eventId) external view returns(address){
        return events[_eventId];
    }  
    
    function getEventsId(string memory _tittle) external view returns(uint256){
        return eventsId[_tittle];
    }  
}
