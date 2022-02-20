//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./MatchLink.sol";

struct MatchProposal {
    string reason;
    MatchLink[] matchingPairs;
}
