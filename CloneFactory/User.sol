// SPDX-License-Identifier: MIT
pragma solidity >0.4.23 <0.9.0;

contract User {
    address public owner;
    string public name;
 
    function init(string memory _name, address _owner) public {
        name = _name;
        owner = _owner;
    }
}