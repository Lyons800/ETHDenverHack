//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Guild {
    // Todo: Implement IERC721 or create separate role NFT contract

    string private name;
    address[] private members; 

    constructor(string memory _name, address[] memory _initialMembers) {
        console.log("Creating new guild ", _name);
        members = _initialMembers;
    }

    function getName() public view returns (string memory) {
        return name;
    }
}
