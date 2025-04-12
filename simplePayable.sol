// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimplePayable {
    
    address public owner;

    constructor() {
        owner = msg.sender; // Setting the owner 
    }

    // This makes sure only the owner can call some functions
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    // This function just accept ETH
    receive() external payable {
        
    }

    //  fallback function for when someone calls an unknown function
    fallback() external payable {
        
    }

    // This function returns how much ETH is in the contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // This function sends all ETH in the contract to the owner
    function withdrawAll() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    // This function lets the owner send a specific amount to another address
    function withdrawTo(address payable _to, uint _amount) public onlyOwner {
        require(_to != address(0), "Can't send to zero address");
        require(_amount > 0, "Amount must be more than zero");
        require(address(this).balance >= _amount, "Not enough balance in contract");

        _to.transfer(_amount);
    }
}