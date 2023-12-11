# Audit Report

### Contract Name : Storage Victim
### Version       : 0.4.23
### Done By       : Abhishek


## 1)Mutable State
### Vulnerability :  Moderate
The state variable which stores the address of the owner is left
mutable. Since unnecessary updations to the owner might cause issues,it is recommended to make the state immutable.
### Changes Recommended:
Change the owner state declaration to `address immutable
owner;`

## 2)Constructor Syntax
### Vulnerability :  Normal
The syntax of the constructor has been changed from the contract
name to 'constructor'.
### Changes Recommended:
Change the constructor signature from `function
StorageVictim() public {...}` to `constructor() {...}`

## 3)Uninitialized Pointer Vulnerability
### Vulnerability :  Severe
The Storage Pointer str is Uninitialized. Due to this 'str.user'
points to address `0` by default which is the contract owner’s address.
### Changes Recommended:
We can Initialize the `str` to `storages[msg.sender]` in the store function.

### Small Changes:
1)SPDX License: The license line could be added. The License
comment line is a standard way to specify the license under which
the contract is released

2)Parameter naming: The parameter `_amount` of the function
store could be changed to `amount`. This naming convention is
recommended by the solidity team

3)Uint to Uint256: Use uint256 for future-proof code. uint256
provides better information about the size and adds clarity to the
code. Also the size of uint might change in the further updates.


### Final Conclusion:
The contract `StorageVictim` contains a critical vulnerability
related to uninitialized pointers. The recommended update might be
helpful in enhancing the security of the contract.

### Author: Yaswanth Sirigiri
