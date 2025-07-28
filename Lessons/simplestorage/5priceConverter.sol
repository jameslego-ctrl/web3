// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

// Library : when a functionality can be used commonly ,we can create a library to efficiently manage repeated parts of code
//          for example : in 4FundMe.sol we use getprice() and getConversionRate() so we created a library for them in 5priceConverter.sol
//                         to called it again in 4test.sol

// The same can be done as 4FundMe.sol using library in 5priceConverter.sol & 4test.sol

library priceConverter{
    function getprice() internal view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256){
        uint256 ethPrice = getprice();
        uint256 ethAmountInUsd = ethPrice * ethAmount;
        return ethAmountInUsd;
    }

    function getversion() internal view returns(uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}


/* ### IMPORTANT NOTES ###
1. All functions in a library must be declared as internal and are embedded in the contract during compilation
2. solidity libraries are similar to contracts but not allow to declare state variables and cannot receive ETH
3. we can import the library in our contract and attach it to the desired type with the keyword "using" */