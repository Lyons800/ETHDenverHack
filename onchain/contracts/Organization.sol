//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./OnboardingBounty.sol";
import "./Guild.sol";

contract Organization {
    uint256 public memberCount;
    mapping (address => bool) public members;

    constructor(string memory name) {
        members[msg.sender] = true;
        memberCount = 1;
    }

    function leave() public onlyMember {
        members[account] = false;
        memberCount -= 1;

        // Todo: implement graceful organization shutdown in case no members are left
    }

    function isMember(address account) public view returns (bool) {
        return members[account];
    }

    modifier onlyMember {
        require(isMember(msg.sender));
    }
}
