//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract simpleStorage{
    //Datatypes : boolean,integers,unsigned integers,strings,bytes
    //Datatypes : bool,     int,        uint,          string,bytes

    bool hasFavoriteNumber = false;        // true or false

    uint256 FavoriteNumber = 88;          //uint and uint256 means the same we can specify diff bits to uint
                                          //the max of a uint is uint256 
                                          //by default the size of uint is uint256 , so they mean the same
                                          // range is 0 <= 1.15 x 10^77

    int256 favoriteNumber = -88;          //int and int256 means the same we can specify diff bits to int
                                          //int64 , int32 

    string favorite_number = "eighty-eight";

    address Myaddress = 0x3CA99294a4327B1A8BD6D9e986b54C8e030E6d50;     //this addr is just a demo addr

    bytes32 favorite_bytes = "cat";
    // Largest byte is 32       bytes & bytes32 are not the same thing they are different




}