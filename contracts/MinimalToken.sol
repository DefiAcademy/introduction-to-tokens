// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract MinimalToken {
    // address of token holder => balance 
    mapping(address => uint256) public balances;
    
    uint256 public totalSupply;
    
    constructor() {
        totalSupply = 3000;
        
        balances[msg.sender] = totalSupply / 3;
        
        balances[0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2] = totalSupply / 3;
        
        balances[0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c] = totalSupply / 3;
    }
    
    function transfer(address _to, uint256 _amount) external {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] = balances[msg.sender] - _amount;
        balances[_to] = balances[_to] + _amount;
    }
}
