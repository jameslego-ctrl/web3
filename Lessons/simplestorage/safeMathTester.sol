// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;


contract safeMathTester{
        uint8 public bigNumber = 255;   // the maximum value uint8 can hold is 255
                                        // or upper limit is 255;

        function add() public {
            bigNumber += 1;
        }
}

/* Notice we are using compiler version 0.6.0. The bigNumber is a uint8 variable with a maximum value of 255. If we 
call the add function, it will return 0 instead of the expected 256.

Before Solidity version 0.8.0, signed and unsigned integers were unchecked, meaning that if 
they exceeded the maximum value the variable type could hold, they would reset to the lower limit. This pattern is known
as integer overflow and the SafeMath library was designed to prevent it.

###
Solidity 0.8.0
With the introduction of Solidity version 0.8, automatic checks for overflows and underflows were implemented, making SafeMath 
redundant for these checks. If SafeMathTester.sol is deployed with Solidity 0.8.0, invoking the add function will cause a transaction 
to fail, when, in older versions, it would have reset to zero.

For scenarios where mathematical operations are known not to exceed a variable's limit, Solidity introduced the unchecked construct to
make code more gas-efficient. Wrapping the addition operation with unchecked will ignore the overflow and underflow checks: if the bigNumber
exceeds the limit, it will wrap its value to zero.

 */