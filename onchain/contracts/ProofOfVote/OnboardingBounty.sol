//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./Guild.sol";

contract OnboardingBounty {
    string public name;
    mapping(address => Submission) public submissions;
    
    constructor(Guild origin, string memory _name) {
        // Todo: Predefine bounty amount
        console.log("Creating new onboarding bounty. Description:", _name);
        name = _name;
    }
    
    function submitWork(string memory _uri, address _submitter) public {
        submissions[_submitter] = Submission(_uri);
    }

    function complete(address[] calldata winners) public {
        // Todo: Payout bounty
    }

    struct Submission {
        string uri;
    }
}
