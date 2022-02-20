//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./OrderBook.sol";

contract SemanticSwap {
    OrderBook public orderBook;
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
