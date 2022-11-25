//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Whitelist {

    // max number of addresses that can be whitelisted
    uint8 public maxWhitelistedAddresses;
    // keep track of addresses whitelisted till now
    uint8 public numAddressesWhitelisted;

    mapping(address => bool) public whitelistedAddresses;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "User already in Whitelist");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Max limit has reached");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}