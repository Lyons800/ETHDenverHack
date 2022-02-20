//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./Order.sol";

contract OrderBook {
    // Descriptions of what can possibly be done, according to the participant who submitted the order
    Order[] public openOffers;

    // Descriptions of what should be done, according to the participant who submitted the order
    Order[] public openAsks;

    // I need my phone charged
    // I am hungry for something with chicken
    // B               (  T                  )

    function submitOffer(string memory _statement) public {
        Order order = new Order(msg.sender, _statement);
        openOffers.push(order);
        emit OfferSubmitted(order.participant(), order.statement(), order);
    }
    
    function submitAsk(string memory _statement) public {
        Order order = new Order(msg.sender, _statement);
        openAsks.push(order);
        emit AskSubmitted(order.participant(), order.statement(), order);
    }

    event OfferSubmitted(address _participant, string _statement, Order _order);
    event AskSubmitted(address _participant, string _statement, Order _order);

    function offerLength() public view returns(uint256 length) {
        return openOffers.length;
    }
    
    function askLength() public view returns(uint256 length) {
        return openAsks.length;
    }

    function getOffer(uint256 index) public view returns(address offer) {
        return address(openOffers[index]);
    }
    
    function getAsk(uint256 index) public view returns(address ask) {
        return address(openAsks[index]);
    }
}
