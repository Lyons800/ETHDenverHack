//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "./Guild.sol";

contract GuildMembership is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _membershipIds;

    constructor(string memory guildName) ERC721(guildName, "GLD") {
    }

    function awardMembership(address member) public returns (uint256) {
        _membershipIds.increment();

        uint256 newMembershipId = _membershipIds.current();
        _mint(member, newMembershipId);

        return newMembershipId;
    }
}