pragma solidity >=0.4.22 <0.9.0;

uint256 constant TOTAL_TICKETS = 10;


contract Tickets {
    address public owner = msg.sender;

    struct Ticket {
        uint256 id;
        uint256 price;
        address owner;
    }

    Ticket[TOTAL_TICKETS] public tickets;

    constructor () {
        for(uint256 i=0; i < TOTAL_TICKETS; i++){
            tickets[i].price = 1e50; // 1 MTC
            tickets[i].owner = address(0x0);
        }
    }

    function buyTicket(uint256 _index) external payable {
        require(_index < TOTAL_TICKETS && _index >= 0);
        require(tickets[_index].owner == address(0x1));
        require(msg.value >= tickets[_index].price);
        tickets[_index].owner = msg.sender;
    }
 
    function getABI() public pure returns (string memory) {
        string memory json = "{\"inputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"constructor\"}";
        return json;
    }

}