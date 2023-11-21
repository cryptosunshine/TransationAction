// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract NFT721 is ERC721 {
    uint256 public tokenCounter;

    constructor() ERC721("Doge card", "DOGECARD") {
        tokenCounter = 0;
    }

    function mint(address to) public {
        _mint(to, tokenCounter);
        tokenCounter++;
    }
}