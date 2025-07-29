// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {priceConverter} from "./5priceConverter.sol";

contract FundMe {
    using priceConverter for uint256;

    address[] public funders;
    uint256 public minimumUsd = 5e18;
    mapping(address funders => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable{
        require(msg.value.getConversionRate() >= minimumUsd,"didn't send enough ETH" );
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;

    }

    //function withdraw() public {}


}


// 3796.440966000000000000