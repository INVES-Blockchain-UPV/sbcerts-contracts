pragma solidity ^0.8.9;

import "./BToken.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract BFactory is Initializable, UUPSUpgradeable, OwnableUpgradeable{

    event eventCreated(address indexed _event, uint256 _currentEvent, string _name);
    event removeEvent(address indexed _event, uint256 _eventid);

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
        address _events,
        string memory _startDate,
        uint256 _duration,
        string memory _title,
        string memory _description
    ) public  onlyOwner{
        require(_events != address(0x0));
        require( bytes(_title).length > 0 && bytes(_title).length < 20, "Name invalid!");
        require( bytes(_description).length > 40 && bytes(_description).length > 40, "Description must be 40-200 characters!");
        require(_duration > 300, "Minimum time votation 5 minutes");
        
    }  
    
}
