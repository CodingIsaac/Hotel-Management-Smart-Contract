// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./hotelTicket.sol";

contract hotelRoomManagement {
    enum accomodationStatus {Vacant, Booked}
    accomodationStatus public currentState;
    address payable public hotelOwner;
    uint public roomCharges;
    uint[] public noOfRooms;
    mapping(address => uint) balance;
    

    event Book(address _roomOccupant, uint _lodgingPrice);

    constructor() {
        hotelOwner = payable(msg.sender);
        currentState = accomodationStatus.Vacant;
        noOfRooms = 50;


    }
    receive() external payable {}
    fallback() external payable {}

    modifier whileVacant() {
        require(currentState == accomodationStatus.Vacant, "Currently Booked." );
        _;
    }

    modifier roomCost() {
        require(msg.value >= roomCharges, "Insufficient Funds" );
        _;
    }

    function determineRoomStatus() public view returns(bool) {
        for ( uint i = 50; i >= noOfRooms; i--) {
            if ()
        }
    }

    function book(uint _roomCost) whileVacant public {
        roomCharges = _roomCost;
        uint roomNumber = determineRoomStatus();
        
        balance[msg.sender] += msg.value;
        currentState = accommodationStatus.Booked;
        noOfRooms--;
        emit  Book(msg.sender, msg.value)


       
    }


}