//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./IMatchListener.sol";

contract Order {
    constructor(address _participant, string memory _statement, IMatchListener _matchListener) {
        participant = _participant;
        statement = _statement;
        matchListener = _matchListener;
    }

    address public participant;
    string public statement;
    IMatchListener public matchListener;
}
