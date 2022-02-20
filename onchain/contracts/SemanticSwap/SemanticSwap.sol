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
    mapping (address => MatchProposal[]) matchProposalParticipation;

    function proposeMatch(string calldata reason, MatchLink[] calldata matchLinks) public {
        MatchProposal prop = new MatchProposal(reason);
        
        for (uint256 i = 0; i < matchLinks.length; i++) {
            matchProposalParticipation[matchLinks[i].producer.participant()].push(prop);
            matchProposalParticipation[matchLinks[i].consumer.participant()].push(prop);
            prop.AddLink(matchLinks[i].producer, matchLinks[i].consumer);
        }
        
        matchProposals.push(prop);
    }

    function listMatchProposals(address user) public view returns(MatchProposal[] memory proposals) {
        return matchProposalParticipation[user];
    }
}
