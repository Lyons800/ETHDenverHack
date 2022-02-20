//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./Order.sol";

struct MatchLink {
    Order producer;
    Order consumer;
}
