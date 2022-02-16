//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./OnboardingBounty.sol";
import "./Guild.sol";

contract Vote {
    address private proposer;
    string private ipfsDescription;
    Guild private origin;

    constructor(Guild _origin, string memory _ipfsDescription) {
        require(_origin.isMember(msg.sender));
        
        proposer = msg.sender;
        ipfsDescription = _ipfsDescription;
        origin = _origin;
    }
}
