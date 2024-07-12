// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract EthAvax1 {
    uint256 public number;
    address public owner;

    event NumberUpdated(uint256 oldValue, uint256 newValue);
    event NumberReset(uint256 oldValue);

    constructor() {
        owner = msg.sender;
    }

 
    function setNumber(uint256 _number) public {
        require(_number > 0, "Number must be greater than zero.");
        number = _number;
    }


    function doubleNumber() public {
        uint256 oldValue = number;
        number *= 2;
        assert(number > 0);
        emit NumberUpdated(oldValue, number);
    }

    function resetNumber() public {
        if (msg.sender != owner) {
            revert("Only the owner can reset the number.");
        }
        uint256 oldValue = number;
        number = 0;
        emit NumberReset(oldValue);
    }
}

