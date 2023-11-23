// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract NFT is ERC1155 {
    uint256 public tokenCounter;

    constructor(string memory uri) ERC1155(uri) {
        tokenCounter = 0;
    }

    function setURI(string memory newuri) public {
        _setURI(newuri);
    }

    function mint(address to, uint256 amount) public  {
        _mint(to, tokenCounter, amount, "");
        tokenCounter++;
    }
    function burn(address to, uint256 tokenId, uint256 amount) public {
        _burn(to, tokenId, amount);
    }

    function batchMint(address to, uint256[] memory amounts) public  {
        uint256[] memory ids = new uint256[](amounts.length);
        for (uint256 i = 0; i < amounts.length; i++) {
            ids[i] = tokenCounter;
            tokenCounter++;
        }
        _mintBatch(to, ids, amounts, "");
    }
}