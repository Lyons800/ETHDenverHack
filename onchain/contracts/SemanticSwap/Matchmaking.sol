//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./Order.sol";

contract MatchProposal {
    string public reason;
    MatchLink[] public matchingPairs;
    //DeltaPayment[] public deltaPayments;
}

contract MatchLink {
    Order public producer;
    Order public receiver;
}
