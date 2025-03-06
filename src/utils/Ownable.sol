// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

abstract contract Ownable {
    event OwnershipTransferred(address indexed user, address indexed newOwner);

    address public owner;

    modifier onlyOwner() virtual {
        require(msg.sender == owner, "UNAUTHORIZED");
        _;
    }

    constructor(address _owner) {
        owner = _owner;
        emit OwnershipTransferred(address(0), _owner);
    }

    //@audit - check of the new owner is a valid address
    function transferOwnership(address _owner) public virtual onlyOwner {
        owner = _owner;
        emit OwnershipTransferred(msg.sender, _owner);
    }
}
