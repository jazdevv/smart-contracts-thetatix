// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "contracts/thetatix-tickets.sol";

contract ticketsFactory {
    address[] public createdTickets;
    address public admin;

    constructor(){
        admin = msg.sender;
    }

    function createEvent(string memory _name,
    string memory _description,uint _ticketPrice,uint _maxTickets,string memory _eventDate) public returns(address)
    {
    
        Tickets newEvent = new Tickets(msg.sender, _name, _description, _ticketPrice, _maxTickets, _eventDate);
        address addr = address(newEvent);
        createdTickets.push(addr);
        return(addr);
    }

    function working() public pure returns(string memory){
        return "yes smart contract deployed";
    }


}