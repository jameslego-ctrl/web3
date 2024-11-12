//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;


import {SimpleStorage} from "./2simplestorage.sol";

// Inheritence : AddFiveStorage is inheriting all the functionality of SimpleStorage 
//               inheritence allow to use all the functions of an contract in an diff contract



//here we are incrementing the value of myFavoriteNumber using the store function that is present inside the SimpleStorage contract
// using the contract AddFiveStorage with the help of inheritance


contract AddFiveStorage is SimpleStorage{

    // +5
    // override : allows the modification of a function from an another contract
    // virtual override : the parent contract should use the "virtual" func in the parent function 
    //                     to allow the override of the functionality

    function store(uint256 _newNumber) public override{
        myFavoriteNumber = _newNumber + 5;
    }

}

