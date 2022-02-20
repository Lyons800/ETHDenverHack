//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./Organization.sol";

contract Mission {
    address public proposer;
    string public goal;
    Organization public origin;

    constructor(Organization _origin, string memory _goal) {
        require(_origin.isMember(msg.sender));
        
        proposer = msg.sender;
        goal = _goal;
        origin = _origin;
    }

    modifier onlyOrganizationMember {
        require(origin.isMember(msg.sender));
        _;
    }

    uint256 public missalignmentCount;
    mapping(address => MissalignmentVote) explicitMissalignmentVotes;

    function expressMissalignment(MissalignmentVote calldata vote) public onlyOrganizationMember {
        if (keccak256(abi.encodePacked(vote.reason)) == keccak256(abi.encodePacked(""))) {
            revert();
        }

        if (keccak256(abi.encodePacked(explicitMissalignmentVotes[msg.sender].reason)) == keccak256(abi.encodePacked(""))) {
            missalignmentCount += 1;
        }
        
        explicitMissalignmentVotes[msg.sender] = vote;
    }

    function revokeMissalignment() public onlyOrganizationMember {
        if (keccak256(abi.encodePacked(explicitMissalignmentVotes[msg.sender].reason)) == keccak256(abi.encodePacked(""))) {
            missalignmentCount -= 1;
        }
        
        explicitMissalignmentVotes[msg.sender] = MissalignmentVote("");
    }

    struct MissalignmentVote {
        string reason;
    }
}
