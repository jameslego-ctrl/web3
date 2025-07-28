// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    address[] public funders;
    uint256 public minimumUsd = 5e18;
    mapping(address funders => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable{
        require(getConversionRate(msg.value) >= minimumUsd,"didn't send enough ETH" );
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;

    }

    //function withdraw() public {}

    function getprice() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getprice();
        uint256 ethAmountInUsd = ethPrice * ethAmount;
        return ethAmountInUsd;
    }

    function getversion() public view returns(uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

}


// 3796.440966000000000000