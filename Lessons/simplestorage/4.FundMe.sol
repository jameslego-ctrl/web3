// we will learn  to transfer ETH to a smart contract by creating a fund function

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract FundMe {

    function fund() public payable{
        require(msg.value > 1e18,"didn't send enough ETH");
    }
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