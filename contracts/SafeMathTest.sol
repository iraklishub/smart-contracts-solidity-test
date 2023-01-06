// SPDX-License-Identifier: MIT

// pragma solidity ^0.6.0;
pragma solidity ^0.8.0;

contract SafeMathTest {
    uint8 public bigestNumber = 255; // checked

    function add() public {
        unchecked {bigestNumber = bigestNumber + 1;}
        // bigestNumber = bigestNumber + 1;
    }
}