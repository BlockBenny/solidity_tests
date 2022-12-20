// SPDX-License-Identifier: MIT
pragma solidity >0.4.23 <0.9.0;

import "./User.sol";
import "@optionality.io/clone-factory/contracts/CloneFactory.sol";
import "zeppelin-solidity/contracts/ownership/Ownable.sol";

contract UserFactory is CloneFactory, Ownable {

    //Array of generated Objects
    User[] private _users;

    //Master User object
    //Deploy the master contract and paste it's address to the Factory constructor
    address public masterUserAddress;

    //Event that a User was created
    event UserCreated(address newUser);

    //Factory constructor with Master address
    constructor(address _masterUserAddress) public {
        masterUserAddress = _masterUserAddress;
    }

    //Change the Master address
    function setLibraryAddress(address _masterUserAddress) public onlyOwner {
        masterUserAddress = _masterUserAddress;
    }

    //Create User with the Factory
    function createUserWithCloneFactory(string _name) public onlyOwner {
        address clone = createClone(masterUserAddress);
        User(clone).init(_name, msg.sender);
        _users.push(User(clone));
        emit UserCreated(clone);
    }

    //Return the Users array to see what is in there
    function allUsers() public view returns (User[] memory)
    {
        return _users;
    }
}