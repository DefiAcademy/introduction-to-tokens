// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC777/ERC777.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC777/IERC777.sol";

contract MyERC777 is ERC777 {
    constructor() ERC777("MyERC777", "My7", new address[](0)){
        _mint(msg.sender, 1000 * 10**18, "", "");   
    }
}

contract SubscriptionContract is IERC777Recipient {
    IERC777 public tokenInstance;
    
    constructor(address _tokenInstance) {
        tokenInstance = IERC777(_tokenInstance);
        IERC1820Registry(0x1820a4B7618BdE71Dce8cdc73aAB6C95905faD24)
        .setInterfaceImplementer(address(this), 
        keccak256("ERC777TokensRecipient"),
        address(this));    
    }
    
    function tokensReceived(
        address operator,
        address from,
        address to,
        uint256 amount,
        bytes calldata userData,
        bytes calldata operatorData
    ) override external {
      // perform any operation when we receive tokens, i.e revert
      // revert();
    }
    
    function chargeFee() external {
        tokenInstance.operatorSend(address(msg.sender), address(this), 10 * 10**18, "", "");
    }
}
