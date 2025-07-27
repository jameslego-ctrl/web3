// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

// Import the Chainlink Aggregator interface to get live ETH/USD prices
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

// @title FundMe - A simple crowdfunding smart contract using ETH & Chainlink price feeds
contract FundMe {

    // Minimum USD amount required to fund (scaled to 18 decimals for consistency with ETH)
    uint256 public minimumUsd = 5e18; // $5.00

    // Track all funders' addresses
    address[] public funders;

    // Mapping from funder address to amount funded (in wei)
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    /**
     * @notice Allows users to fund the contract if they meet the minimum USD amount
     * @dev Converts sent ETH to USD using Chainlink price feed
     */
    function fund() public payable {
        // Ensure value sent is above the minimum threshold in USD terms
        require(getConversionRate(msg.value) >= minimumUsd, "didn't send enough ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;

    }

// payable : for the function fund to be able to receive ETH , it must be declared payable

// value : when a transaction is send to the blockchain , a value field is always included in the transaction data,
//         this field indicates the amount of the native cryptocurrency being transferred in that particular transaction

// msg.value : in solidity , the value of a transaction is accessible through the msg.value property. This property is part of 
//              the global object msg . It represents the wei transferred in the current transaction. 

// 1e18 == 1 ETH == 1 * 10 ** 9 gwei == 1*10**18 wei

// require : acts as a checker/condition to ensures that the transactions meets the minimum ether requirements,allowing the function to 
//           execute only if the threshold is satisfied. can include a custom error message displayed if the condition isn't met




// ### IMPORTANT NOTES ###

// 1. wallet addressed and smart contracts are capable of holding and managing cryptocurrency funds. This entities can interact with the funds,
//     perform transactions, and maintain balance records just like a wallet.


    // Uncomment and complete this function to allow withdrawals by the contract owner
    // function withdraw() public {
    //     // Owner withdrawal logic goes here (not implemented)
    // }

    /**
     * @notice Gets the most recent ETH/USD price from Chainlink
     * @return USD price of 1 ETH scaled to 18 decimal places
     */
    function getPrice () public view returns(uint256) {
        // Chainlink ETH/USD price feed address (Sepolia testnet in this example)
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price,,,) = priceFeed.latestRoundData();
        // Price has 8 decimals, convert to 18 decimals
        return uint256(price * 1e10);
    }

    /**
     * @notice Converts a given amount of ETH (in wei) to its equivalent USD value
     * @param ethAmount The ETH amount in wei
     * @return Equivalent USD value (18 decimals)
     */
    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        // (ETH price in USD * amount of ETH) / 1e18 to adjust decimals
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    /**
     * @notice Gets the current version of the Chainlink Price Feed Aggregator
     * @return Version number (e.g., 4)
     */
    function getVersion() public view returns(uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}

/*
    ====== Notes ======
    - This contract implements a crowdfunding mechanism where anyone can send ETH
      as long as it's worth at least $5 (using live Chainlink price feed).
    - The price feed address is for Sepolia testnet; change for other networks.
    - No withdraw() logic or owner features are implemented yet.
    - This is demo code — for production, add access control and test thoroughly.
*/
