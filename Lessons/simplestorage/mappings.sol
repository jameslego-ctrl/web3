// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract simplestorage{


    // MAPPING using the mapping()
    // if there is large num of data in an array 
    // we can use mapping to read the data using the name or other parameters

  struct person {
    
    uint256 favoriteNumber;
    string name;
  }

  person[] public listofpeople;

  mapping(string => uint256) public nametoNumber;
  mapping(uint256 => string) public numbertoName;


  function addperson(string memory _name, uint256 _favoriteNumber) public{
    listofpeople.push(person(_favoriteNumber,_name));
    nametoNumber[_name] = _favoriteNumber;
    numbertoName[_favoriteNumber] = _name;
  }
}