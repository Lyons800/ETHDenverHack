//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract OrderBook {
    // Descriptions of what can possibly be done, according to the participant who submitted the order
    Order[] public openOffers;

    // Descriptions of what should be done, according to the participant who submitted the order
    Order[] public openAsks;

    // I need my phone charged
    // I am hungry for something with chicken
    // B               (  T                  )
}
