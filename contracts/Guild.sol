//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./OnboardingBounty.sol";

contract Guild {
    // Todo: Implement IERC721 or create separate role NFT contract

    string private name;
    address[] private members;
    OnboardingBounty[] private activeBounties;

    constructor(string memory _name, address[] memory _initialMembers) {
        console.log("Creating new guild ", _name);
        members = _initialMembers;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function publishBounty(string memory _ipfsDescription) public {
        // Todo: Add deadline (?)
        activeBounties.push(new OnboardingBounty(_ipfsDescription));
    }
}
