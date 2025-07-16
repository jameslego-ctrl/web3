//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract simpleStorage{

    //Dynamic Array : the size of the array can change according to the data input in it
    uint256[] listofFavoriteNumber;                     //this is an array of uint256 with no data in it



    //static array : the size of the array is predefined while creating the array thus have a fix size 
    uint256[3] public listofFavoriteNumber2 = [1,2,3];   //this is an array with the data uint ,indexing starts at 0,1,2...



    //we can create our own datatypes that groups multiple variables in solidity using the "struct"
    struct person{
        uint256 favoriteNumber;
        string name;
    }
    // person public pat = (7,"pat");
    // person public pat = person({favoriteNumber:7, name : "pat"});
    // person public alex = person({favoriteNumber:8, name:"alex"});


    //instead of creating person one by one we can do that in an array[]
    person[] public listofpeople;
    person[] public listofpeople2;


    // pushing the data of the person in the listofpeople array
    function addperson1(string memory _name,uint256 _favoriteNumber) public{
        person memory Newperson = person(_favoriteNumber,_name);
        listofpeople2.push(Newperson);
    }

    //Alternatively it can be done as below
    function addperson(string memory _name, uint256 _favoriteNumber)public {
        listofpeople.push(person(_favoriteNumber,_name));
    }

    // calldata,memory & storage

    // calldata & memory are both use for temporary store of variable 
    // diff is calldata variable can't be modified when used in a function 
    // memory : we can modify the function 
    // storage is a permanent store of variable
    // example:

    // function addperson(string calldata _name,uint256 _favoriteNumber) public {
    //     _name = "cat";
    // }
    // it will throw an error since the calldata is not modifiable so it ll unable to convert




    // function addperson(memory _name, uint256 _favoriteNumber)public{
    //     _name = "cat";
    // };
    // and if we use memory it won't be an error
}

