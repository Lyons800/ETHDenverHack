//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Order {
    constructor(address _participant, string memory _statement) {
        participant = _participant;
        statement = _statement;
    }

    address participant;
    string statement;
}
