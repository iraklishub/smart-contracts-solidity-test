// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract test {
    uint256 public myNumber;

    function myFunc(uint256 _myNumber) public {
        myNumber = _myNumber;
    }

    function seeNumber() public view returns(uint256) {
        return(myNumber);
    }
}