//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./OnboardingBounty.sol";
import "./GuildMembership.sol";
import "./Vote.sol";

contract Guild {
    string public name;
    GuildMembership private membershipToken;
    OnboardingBounty[] private bounties;
    Vote[] private votes;

    constructor(string memory _name, address[] memory _initialMembers) {
        console.log("Creating new guild ", _name);
        membershipToken = new GuildMembership(_name);

        // award initial memberships
        for(uint256 i = 0; i < _initialMembers.length; i++) {
            membershipToken.awardMembership(_initialMembers[i]);
        }
    }

    function isMember(address account) public view returns (bool) {
        return membershipToken.balanceOf(account) > 0;
    }

    function publishBounty(string memory _ipfsDescription) public onlyMember {

        // Todo: Add deadline (?)
        bounties.push(new OnboardingBounty(_ipfsDescription));
    }

    function publishVote(string memory _ipfsDescription) public onlyMember {
        // Todo: Add deadline (?)
        votes.push(new Vote(this, _ipfsDescription));
    }

    modifier onlyMember {
        require(isMember(msg.sender));
        _;
    }
}
