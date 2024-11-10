// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//adding the contract "SimpleStorage" from simpleStorage.sol
//another way to do is >>>>>>>      import "./simpleStorage.sol";
// it will add all the file simpleStorage.sol

// if we want to use a specific contract instead of all the file we use the following command
// import {SimpleStorage,contract2,contract3,.....} from "./simpleStorage.sol"
//          contract name           :   multiple contract can be imported


contract SimpleStorage {
    uint256 myFavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray;
    Person[] public listOfPeople;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}



contract StorageFactory{
    SimpleStorage public simplestorage;

    function createSimpleStorage() public {
        simplestorage = new SimpleStorage();
    }
    // new keyword is used to make new contract 
    // here simplestorage is a new contract same as SimpleStorage created using the contract StorageFactory

}