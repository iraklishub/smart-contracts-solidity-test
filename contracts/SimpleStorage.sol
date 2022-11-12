// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract simpleStorage {
    struct People {
        uint256 favoriteNumber;
        string name;
    }
    
    // People public people = People({favoriteNumber: 2, name: "John"});

    People[] public people;
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));

        // people.push(People({favoriteNumber: _favoriteNumber, name: _name}));

        // People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        // People memory newPerson = People(_favoriteNumber, _name);
        // people.push(newPerson);
    }


    // uint256 public favoriteNumber;
    // function store(uint256 _favoriteNumber) public {
    //     favoriteNumber = _favoriteNumber;
    // }

    // function retrieve() public view returns(uint256) {
    //     return favoriteNumber;
    // }
}

