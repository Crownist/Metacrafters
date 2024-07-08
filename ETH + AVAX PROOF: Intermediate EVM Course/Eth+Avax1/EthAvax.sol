// SPDX-License-Identifier: MIT.
pragma solidity 0.8.18;

contract EthAvax1 {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    mapping(address => uint256) public balances;

    function deposit(uint256 amount) public {
        require(amount > 0, "Please, deposit an amount that is greater than zero!");
        balances[msg.sender] += amount;
    }

    function transfer(address recipient, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Your balance is insufficient, please try again.");

        assert(balances[recipient] + amount >= balances[recipient]);

        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }

    function withdraw(uint256 amount) public {
        if (balances[msg.sender] < amount) {
            revert("Insufficient balance for withdrawal, please try again.");
        }
        balances[msg.sender] -= amount;
    }
}
