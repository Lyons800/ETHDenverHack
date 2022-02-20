//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./Order.sol";

contract OrderBook {
    constructor() {
        openOffers = new Order[](0);
        openAsks = new Order[](0);
    }

    // Descriptions of what can possibly be done, according to the participant who submitted the order
    Order[] public openOffers;

    // Descriptions of what should be done, according to the participant who submitted the order
    Order[] public openAsks;

    // I need my phone charged
    // I am hungry for something with chicken
    // B               (  T                  )

    function submitOffer(string memory _statement) public {
        openOffers.push(new Order(msg.sender, _statement));
    }
    
    function submitAsk(string memory _statement) public {
        openOffers.push(new Order(msg.sender, _statement));
    }
}
