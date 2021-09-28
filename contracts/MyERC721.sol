// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

contract MyERC721 is ERC721 {
    uint256 public creatureId;
    
    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol){
        creatureId = 1;
    }
    
    function redeemNFT() external {
        _safeMint(msg.sender, creatureId);
        creatureId++;
    }
    
    function _baseURI() internal pure override returns (string memory) {
        return "https://opensea-creatures-api.herokuapp.com/api/creature/";
    }
}
