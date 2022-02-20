//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./OrderBook.sol";
import "./Order.sol";
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
            Order producer = matchLinks[i].producer;
            Order consumer = matchLinks[i].consumer;

            matchProposalParticipation[producer.participant()].push(prop);
            matchProposalParticipation[consumer.participant()].push(prop);

            prop.AddLink(producer, consumer);
        }
        
        matchProposals.push(prop);
        
        for (uint256 i = 0; i < matchLinks.length; i++) {
            Order producer = matchLinks[i].producer;
            Order consumer = matchLinks[i].consumer;

            producer.matchListener().OnMatch(prop, producer);
            consumer.matchListener().OnMatch(prop, consumer);
        }
    }

    function listMatchProposals(address user) public view returns(MatchProposal[] memory proposals) {
        return matchProposalParticipation[user];
    }
}
