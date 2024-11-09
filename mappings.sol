// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract simplestorage{
    //mappings using the mapping()
    //if there is large num of data in an array 
    // we can use mapping to read the data using the name or other parameters

    uint256 public favoriteNum;

    struct person{
        uint256 _favNum;
        string _name;
    }
//  array of person
    person[] public listofperson;


//  we are mapping the name with their fav num while adding the data of the person
    function addperson(string memory name,uint256 num) public {
        listofperson.push(person(num,name));
        TofavNum[name] = num;               // using the mapping
    }
    
    mapping (string => uint256) public TofavNum;
}