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

    function proposeMatch(string calldata reason, MatchLink[] calldata matchLinks) public {
        MatchProposal prop = new MatchProposal(reason);
        
        for (uint256 i = 0; i < matchLinks.length; i++) {
            prop.AddLink(matchLinks[i].producer, matchLinks[i].consumer);
        }
        
        matchProposals.push(prop);
    }
}
