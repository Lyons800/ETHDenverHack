//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./MatchLink.sol";

contract MatchProposal {
    constructor(string memory _reason) {
        reason = _reason;
    }

    function AddLink(Order producer, Order consumer) public {
        matchingPairs.push(MatchLink(producer, consumer));
    }

    string reason;
    MatchLink[] matchingPairs;
}
