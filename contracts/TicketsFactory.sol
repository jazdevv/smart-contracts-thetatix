// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./Tickets.sol";

contract ticketsFactory {
    mapping(string=>address)addressGetter;//for database and frontend interaction
    mapping(address=>address[])userCreatedEvents;
    address[] public createdTickets;
    address public admin;
    uint public amountRecaudedFees;

    constructor(){
        admin = msg.sender;
    }

    function createEvent(string memory _name,
    string memory _description,uint _ticketPrice,uint _maxTickets,string memory _eventDate,string memory _uuid) public 
    {
        Tickets newEvent = new Tickets(msg.sender, _name, _description, _ticketPrice, _maxTickets, _eventDate);
        address addr = address(newEvent);
        createdTickets.push(addr);
        addressGetter[_uuid] = addr;
        userCreatedEvents[msg.sender].push(addr);
    }

    function getAddressFromUuid(string memory _uuid)public view returns(address){
        return addressGetter[_uuid];
    }

    function recaudeFees()external payable{
        amountRecaudedFees += msg.value;
    }

    function withdrawfees()external{
        payable(admin).transfer(amountRecaudedFees);
        amountRecaudedFees = 0;
    }

    function working() public pure returns(string memory){
        return "yes smart contract deployed";
    }


}