//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract simpleStorage{

    uint256 public favoriteNumber;          //public : giving the visibility if not specified default to "internal"


    function store(uint256 favorite_number) public {
        favoriteNumber = favorite_number;
    }

    // view & pure : allows to call data , doesn't allow modification of data

    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
    // view : can read data from another function
    // pure : returns only the data assigned can't read data 

    function retrieve2() public pure returns(uint256){

        return 7;
    //  return favoriteNumber;          Not allowed to read data bcoz of pure function    
    }
}