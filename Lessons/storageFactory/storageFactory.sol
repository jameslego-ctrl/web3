// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//adding the contract "SimpleStorage" from simpleStorage.sol
//another way to do is >>>>>>>      import "./simpleStorage.sol";
// it will add all the file simpleStorage.sol

// if we want to use a specific contract instead of all the file we use the following command
// import {SimpleStorage,contract2,contract3,.....} from "./simpleStorage.sol"
//          contract name           :   multiple contract can be imported


//import SimpleStorage contract from simplestorage.sol
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


// creating a new contract 
contract StorageFactory{
    // Declaration of simplestorage : it is declaring that simplestorage is a contract type as SimpleStorage

    SimpleStorage public simplestorage;

    // making an array of contract

    SimpleStorage[] public listofsmartcontract;
//  contract def  visibility  name

    function createSimpleStorage() public {
        simplestorage = new SimpleStorage();           
        listofsmartcontract.push(simplestorage);
    }
    // "new" keyword is used to make new contract 
    // here simplestorage is a new contract same as SimpleStorage created using the contract StorageFactory


    // using the function of "store" from SimpleStorage contract in the contract StorageFactory
    function sfStore(uint256 _simplestorageindex,uint256 _newsimplestoragenumber) public {
        SimpleStorage mysimplestorage = listofsmartcontract[_simplestorageindex];
        mysimplestorage.store(_newsimplestoragenumber);
    }


    // using the function "retrieve" from SimpleStorage
    function sfget(uint256 _simplestorageindex) public view returns(uint256){
        SimpleStorage mysimplestorage = listofsmartcontract[_simplestorageindex];
        return mysimplestorage.retrieve();
    }


    // alternative to use retrieve func.

//     function sfget2(uint256 _simplestorageindex) public view returns(uint256){
//         return listofsmartcontract[_simplestorageindex].retrieve();
//     }
// }

