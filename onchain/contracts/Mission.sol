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

    uint256 public missalignmentCount;
    mapping(address => MissalignmentVote) explicitMissalignmentVotes;

    function expressMissalignment(MissalignmentVote vote) public onlyOrganizationMember {
        if (vote.reasonIpfs == "") {
            revert();
        }

        if (explicitMissalignmentVotes[msg.sender].reasonIpfs == "") {
            missalignmentCount += 1;
        }
        
        explicitMissalignmentVotes[msg.sender] = vote;
    }

    function revokeMissalignment() public onlyOrganizationMember {
        if (explicitMissalignmentVotes[msg.sender].reasonIpfs != "") {
            missalignmentCount -= 1;
        }
        
        explicitMissalignmentVotes[msg.sender] = MissalignmentVote("");
    }

    struct MissalignmentVote {
        string reasonIpfs;
    }
}
