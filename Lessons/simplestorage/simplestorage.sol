//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract simpleStorage{
    //Datatypes : bool,int,uint,string,bytes

    bool hasFavoriteNumber = false;        // true or false

    uint256 FavoriteNumber = 88;          //uint and uint256 means the same we can specify diff bits to uint

    int256 favoriteNumber = -88;          //int and uint 256 means the same we can specify diff bits to int

    string favorite_number = "eighty-eight";

    address Myaddress = 0x3CA99294a4327B1A8BD6D9e986b54C8e030E6d50;     //this addr is just a demo addr

    bytes32 favorite_bytes = "cat";
    // Largest byte is 32       bytes & bytes32 are not same they are different




}