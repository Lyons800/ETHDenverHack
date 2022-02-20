//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721Full.sol";
import "@openzeppelin/contracts/drafts/Counters.sol";

contract GuildMembership is ERC721Full {
    using Counters for Counters.Counter;
    Counters.Counter private _membershipIds;

    constructor(Guild guild) ERC721Full(guild.name, "GLD") public {
    }

    function awardMembership(address member) public returns (uint256) {
        _membershipIds.increment();

        uint256 newMembershipId = _membershipIds.current();
        _mint(member, newItemId);

        return newMembershipId;
    }
}