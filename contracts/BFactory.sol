pragma solidity ^0.8.9;

import "./BToken.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

interface IBToken{
    function startDate() external view returns(uint256);
    function title() external view returns(string memory);
}

contract BFactory is Initializable, UUPSUpgradeable, OwnableUpgradeable{
    
    event EventCreation(address indexed _event, uint256 _eventId, string _name);
    event EventCancelation(address indexed _event, uint256 _eventId, string _name);

    uint256 currentEvent;
    
    mapping(uint256 => address) events; /// event id to Btoken.sol contract  

    function initialize() public initializer {
         ///@dev no constructor -> initialise the OwnableUpgradeable explicitly
        __Ownable_init();
    }

    ///@dev required by the OZ UUPS module
    function _authorizeUpgrade(address) internal override onlyOwner {}
    
    function createEvent(
        uint256 _startDate, 
        uint256 _duration,
        string memory _title,
        string memory _description,
        string memory _url
    ) public  onlyOwner{
        require( bytes(_title).length > 0 && bytes(_title).length < 20, "Name invalid!");
        require( bytes(_description).length > 40 && bytes(_description).length > 40, "Description must be 40-200 characters!");
        require(_duration > 300, "Minimum time votation 5 minutes");
        require(_startDate > block.timestamp, "Start date not valid");

        BToken myEvent = new BToken(
            _title,
            _description,
            _startDate,
            _duration,
            _url
            
        );

        events[++currentEvent] = address(myEvent);

        emit EventCreation(address(myEvent), currentEvent, _title); //address(myEvent)
    }

    function removeCharla(uint256 _id) public onlyOwner{
        require(block.timestamp < IBToken(events[_id]).startDate());

        address addressEvent = events[_id];

        delete events[_id];

        emit EventCancelation(addressEvent, _id, IBToken(events[_id]).title());
    }

    function getEvents(uint256 _eventId) external view returns(address){
        return events[_eventId];
    }  
}
