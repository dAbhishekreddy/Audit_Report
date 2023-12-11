// SPDX-License-Identifier: MIT

// Here we have updated the solidity version from 0.4 to 0.8 bcoz the new versions 
// are with the improvements and updated features 
pragma solidity ^0.8.18;

contract StorageVictim {
    // Here the owner is declared as the immutable to make sure it 
    // can only be assigned a value once during contract deployment
    address immutable owner;

    struct Storage {
        address user;
        // And also here we changeed the data type from uint to uint256
        uint256 amount;
    }

// Here we have declared mapping to store storage structs linked with the specifc adress
    mapping(address => Storage) storages;

    constructor() {
        owner = msg.sender;
    }

    // Here we have declared a function to store data in the contract 
    function store(uint256 amount) public {
        Storage storage str = storages[msg.sender];

        str.user = msg.sender;

        str.amount = amount;

        storages[msg.sender] = str;
    }

    // Here we have declared a function to retrive the stored info
    function getStore() public view returns (address, uint256) {
        Storage storage str = storages[msg.sender];

        return (str.user, str.amount);
    }

    // This function is used to retrive the owner adress
    function getOwner() public view returns (address) {
        return owner;
    }
}
