//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract SemanticSwap {
    // description of what can possibly be done, according to the participant who submitted the order
    Order[] public openOffers;

    // 

    // description of what should be done, according to the participant who submitted the order
    Order[] public openAsks;

    // I need my phone charged
    // I am hungry for something with chicken
    // B               (  T                  )
}

contract MatchProposal {
    string public reason;
    MatchLink[] public matchingPairs;
    DeltaPayment[] public deltaPayments;
}

contract MatchLink {
    Order public producer;
    Order public receiver;
}

contract Order {
    address public participant;
    string public statement;
}
