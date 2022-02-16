//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./Organization.sol";

// 
contract Mission {
    address private proposer;
    string private _missionStatementIpfs;
    Organization private origin;

    constructor(Organization _origin, string memory _missionStatementIpfs) {
        require(_origin.isMember(msg.sender));
        
        proposer = msg.sender;
        _missionStatementIpfs = _missionStatementIpfs;
        origin = _origin;
    }
}
