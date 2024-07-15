// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract NumberValidator {
    function validateNumber(int _num) public pure returns (string memory) {
        require(_num != 0, "Input cannot be zero");
        
        if (_num < 0) {
            revert("Input must be positive");
        }
        
        if (_num > 100) {
            revert("Input must be 100 or less");
        }
        
        assert(_num <= 100 && _num > 0);
        
        if (_num % 2 == 0) {
            return "Even number within range";
        } else {
            return "Odd number within range";
        }
    }
}



