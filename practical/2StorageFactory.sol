// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


// import "./simpleStorage.sol";
import {SimpleStorage} from "./1simpleStorage.sol";

contract  StorageFactory{

    SimpleStorage  simplestorage;
    SimpleStorage[] public listofsmartcontracts;

    function createSimpleStorage() public{
        simplestorage = new SimpleStorage();
        listofsmartcontracts.push(simplestorage);
    }

    function sfStore(uint256 _simplestorageindex, uint256 _newsimplestorageNum) public {
        SimpleStorage mysimplestorage = listofsmartcontracts[_simplestorageindex];
        mysimplestorage.store(_newsimplestorageNum);
    }

    function sfget(uint256 _simplestorageindex) public view returns(uint256) {
        SimpleStorage mysimplestorage = listofsmartcontracts[_simplestorageindex];
        return mysimplestorage.retrieve();
    }
}