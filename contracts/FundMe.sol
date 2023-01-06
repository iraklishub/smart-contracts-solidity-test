// Get funds from users
// Set a minimum funding value in USD
// Withdrow funds

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./PriceConverter.sol";

error notOwner();
error callFailed();
error notEnoughFund();

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;
    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        // require(getConversionRate(msg.value) >= minimumUsd, "Didn't Send Eenough!");
        // require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't Send Eenough!");
        if(msg.value.getConversionRate() < MINIMUM_USD) { revert notEnoughFund(); }

        // msg.value - 18 decimals
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function withdraw() public onlyOwner {
        // require(msg.sender == owner, "Sender is not owner!");

        for (uint256 index = 0; index < funders.length; index++) {
            address funder = funders[index];
            addressToAmountFunded[funder] = 0;
        }
        // reset array
        funders = new address[](0);

        // withdraw funds

        // payable(msg.sender).transfer(address(this).balance); // transfer

        // bool sendSuccess = payable(msg.sender).send(address(this).balance); // send
        // require(sendSuccess, "Send failed.");

        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}(""); // call
        // require(callSuccess, "Call failed.");
        if(!callSuccess) { revert callFailed(); }
    }

    modifier onlyOwner {
        // require(msg.sender == i_owner, "Sender is not owner!");
        if(msg.sender != i_owner) { revert notOwner(); }
        _; // do rest of the code
    }
}