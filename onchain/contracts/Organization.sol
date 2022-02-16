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
        members[msg.sender] = false;
        memberCount -= 1;

        // Todo: implement graceful organization shutdown in case no members are left
    }

    // Todo: Provide interface to onboard new members according to internal decision making processes

    function isMember(address _account) public view returns (bool) {
        return members[_account];
    }

    modifier onlyMember {
        require(isMember(msg.sender));
    }

    // All missions that ever got proposed
    Mission[] public missions;

    function proposeMission(string memory _missionStatementIpfs) public onlyMember {
        missions.push(new Mission(_missionStatementIpfs));
    }
}
