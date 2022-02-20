//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./OrderBook.sol";
import "./MatchProposal.sol";
import "./MatchLink.sol";

contract SemanticSwap {
    constructor() {
        orderBook = new OrderBook();
    }

    OrderBook public orderBook;
    MatchProposal[] public matchProposals;

}
