// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage,SimpleStorage2} from "./simpleStorage.sol";


contract StorageFactory{
    SimpleStorage public simplestorage;

    function createSimpleStorage() public {
        simplestorage = new SimpleStorage();
    }
}
