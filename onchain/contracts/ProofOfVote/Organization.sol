//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./OnboardingBounty.sol";

contract Organization {
    string public name;
    uint256 public memberCount;
    mapping (address => bool) public members;

    constructor(string memory _name) {
        name = _name;
        members[msg.sender] = true;
        memberCount = 1;
    }

    function leave() public onlyMember {
        members[msg.sender] = false;
        memberCount -= 1;
    }

    function isMember(address _account) public view returns (bool) {
        return members[_account];
    }

    modifier onlyMember {
        require(isMember(msg.sender));
        _;
    }
}
