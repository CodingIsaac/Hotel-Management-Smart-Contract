// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./hotelTicket.sol";

contract  hotelRoomManagement is RadissonFlu {
    enum accomodationStatus {
        Vacant,
        Booked
    }
    accomodationStatus public currentState;
    address payable public hotelOwner;
    uint256 public roomCharges;
    uint256 public noOfRooms;
    mapping(address => uint256) balance;
    uint public timeStarts = block.timestamp;
    uint public timeEnds;


    event Book(address _roomOccupant, uint256 _lodgingPrice);

    constructor() {
        hotelOwner = payable(msg.sender);
        roomCharges = 0.20 ether;

        noOfRooms = 50;
    }

    receive() external payable {}

    fallback() external payable {}

    modifier whileVacant() {
        require(currentState == accomodationStatus.Vacant, "Currently Booked.");
        _;
    }

    // modifier onlyOwner() virtual override{
    //     require(msg.sender == hotelOwner, "You are not the Owner");
    //     _;
    // }
    modifier cost() {
        require(roomCharges >= 0.2 ether, "Insufficient funds");

        _;
    }

    modifier roomCost() {
        require(msg.value >= roomCharges, "Insufficient Funds");
        _;
    }

    function determineRoomStatus() public view returns (accomodationStatus) {
        if (currentState == accomodationStatus.Vacant) {
            return accomodationStatus.Vacant;
        } else {
            return accomodationStatus.Booked;
        }
    }

    function book(address _booker, uint _bookingprice) public payable cost whileVacant {
        // roomCharges = _roomCost;
        currentState = determineRoomStatus();
        balance[msg.sender] += msg.value;
        _safeMint(msg.sender, 1);
        timeStarts = block.timestamp;

        emit Book(_booker, _bookingprice);
    }

    function burnTicket() public onlyOwner{
        timeEnds = block.timestamp + 6000;
        _burn(1);

    }

    



}
