//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract OnboardingBounty {
    string private ipfsDescription;
    mapping(address => Submission) private submissions; 

    constructor(string memory _ipfsDescription) {
        console.log("Creating new onboarding bounty. Description:", _ipfsDescription);
        ipfsDescription = _ipfsDescription;
    }

    function describe() public view returns (string memory) {
        return ipfsDescription;
    }
    
    function submitWork(string memory _gitHash, address _submitter) public {
        submissions[_submitter] = Submission(_gitHash);
    }

    struct Submission {
        string gitHash;
    }
}
