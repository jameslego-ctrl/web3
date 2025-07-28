// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//importing the library in our contract
import {priceConverter} from "./5priceConverter.sol";

contract FundMe{

// attaching it to uint256 
    using priceConverter for uint256;
    
    uint256 public minimumUsd = 5e18;
    address[] public funders;
    mapping(address funders => uint256 amountFunded) addressToAmountFunded;

    function fund() public payable{
        require(msg.value.getConversionRate(),"didn't send enough ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }


}