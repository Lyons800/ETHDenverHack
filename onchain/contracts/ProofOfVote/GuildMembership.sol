//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "./Guild.sol";

contract GuildMembership is ERC721 {
    Guild public origin;
    using Counters for Counters.Counter;
    Counters.Counter private _membershipIds;

    constructor(Guild _origin) ERC721(origin.name(), "GLD") {
        origin = _origin;
    }

    function awardMembership(address member) public returns (uint256) {
        require(origin.isMember(msg.sender));

        _membershipIds.increment();

        uint256 newMembershipId = _membershipIds.current();
        _mint(member, newMembershipId);

        return newMembershipId;
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal virtual override
    {
        // No transfer allowed
        revert();
    }
}