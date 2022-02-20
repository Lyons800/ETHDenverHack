//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./OrderBook.sol";
import "./MatchProposal.sol";

contract SemanticSwap {
    constructor() {
        orderBook = new OrderBook();
    }

    OrderBook public orderBook;
    MatchProposal[] public matchProposals;

    function proposeMatch(MatchProposal memory _matchProposal) public {
        matchProposals.push(_matchProposal);
    }
}
