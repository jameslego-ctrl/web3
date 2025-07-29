// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {priceConverter} from "./priceconverter.sol";

error notOwner();

contract FundMe {
    using priceConverter for uint256;
    uint256 public constant MINIMUM_USD = 5e18;
    
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    address public immutable i_owner;

    constructor () {
        i_owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD, "did'nt send enough ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    function withdraw() public onlyOwner {
        // require(msg.sender == owner,"must be owner!");
        for(uint256 funderIndex=0;funderIndex < funders.length;funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
    // reset the array
        funders = new address[](0);
    
    // // actually withdraw the funds from the contract
    //     // 3 ways to withdraw token or funds from a native blockchain
    //     // transfer, send, call
    //     // transfer
    //     payable(msg.sender).transfer(address(this).balance);

    //     // send 
    //     bool sendSuccess = payable(msg.sender).send(address(this).balance);
    //     require(sendSuccess,"send failed");

        // call

        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess,"call failed");

    }

    modifier onlyOwner {
        // require(msg.sender == i_owner,"must be owner!");
        if(msg.sender != i_owner) {revert notOwner();}
        _;
    }

    receive() external payable {
        fund();
    }

    fallback() external payable { 
        fund();
    }
   
}