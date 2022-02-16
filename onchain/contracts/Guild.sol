//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./OnboardingBounty.sol";
import "./GuildMembership.sol";
import "./Vote.sol";

contract Guild {
    // Todo: Implement IERC721 or create separate role NFT contract

    string private name;
    GuildMembership private membershipToken;
    OnboardingBounty[] private bounties;
    Vote[] private votes;

    constructor(string memory _name, address[] memory _initialMembers) {
        console.log("Creating new guild ", _name);
        membershipToken = new GuildMembership(this);

        // award initial memberships
        for(int i = 0; i < _initialMembers.length; i++) {
            membershipToken.awardMembership(_initialMembers[i]);
        }
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function publishBounty(string memory _ipfsDescription) public {
        // Todo: Add deadline (?)
        bounties.push(new OnboardingBounty(_ipfsDescription));
    }

    function publishVote(string memory _ipfsDescription) public {
        // Todo: Add deadline (?)
        votes.push(new Vote(_ipfsDescription));
    }
}
