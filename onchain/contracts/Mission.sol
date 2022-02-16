//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./Organization.sol";

contract Mission {
    address private proposer;
    string private missionStatementIpfs;
    Organization private origin;

    constructor(Organization _origin, string memory _missionStatementIpfs) {
        require(_origin.isMember(msg.sender));
        
        proposer = msg.sender;
        missionStatementIpfs = _missionStatementIpfs;
        origin = _origin;
    }

    modifier onlyOrganizationMember {
        require(origin.isMember(msg.sender));
    }

    mapping(address => MissalignmentVote) explicitMissalignmentVotes;

    function submitVeto(MissalignmentVote vote) public onlyOrganizationMember {
        explicitMissalignmentVotes[msg.sender] = vote;
    }

    struct MissalignmentVote {
        string reasonIpfs;
    }
}
