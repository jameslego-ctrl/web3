// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./1SimpleStorage.sol";

contract addFive is SimpleStorage{
    
    function store(uint256 _num) public override{
        myFavoriteNumber = _num + 5;
    }
}