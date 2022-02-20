//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./MatchProposal.sol";
import "./Order.sol";

interface IMatchListener {
    function OnMatch(MatchProposal proposal, Order ownOrder) external;
}
