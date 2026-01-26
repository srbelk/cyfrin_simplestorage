// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";
// "is" keyword is used to inherit the features of another contract
// SimpleStorage is the "parent" contract AddFiveStorage is inheriting from
// AddFive is considered the "child" contract 
contract AddFiveStorage is SimpleStorage {
// "override" allows a child to use and make changes to a parent virtual function
    function store(uint256 _newNumber) public override  {
        myfavoriteNumber = _newNumber + 5;
    }
}