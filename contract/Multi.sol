// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";

interface IERC721Mintable is IERC721 {
    function mint(address to) external;
    function burn(uint256 tokenId) external;
}

interface IERC1155Mintable is IERC1155 {
    function mint(address account, uint256 amount) external;
    function burn (address to, uint256 id, uint256 amount) external;
}

contract MyContract {


    function transferTokens(
        IERC20 token,
        address to1,
        address to2,
        uint256 amount
    ) public {
        
      token.approve(address(this), amount);

      token.approve(address(this), 0);
      token.transferFrom(msg.sender, to1, amount);
      token.transferFrom(msg.sender, to2, amount);

    }

    function transferNFT721(
        IERC721Mintable nft721,  
        address to,
        uint256 tokenId,
        uint256 tokenId2
    ) public {
        nft721.mint(msg.sender);

        nft721.transferFrom(msg.sender, to, tokenId);

        nft721.mint(msg.sender);

        nft721.safeTransferFrom(msg.sender, to, tokenId2, "");
    }

    function transferNFT721BurnAndApproval(
        IERC721Mintable nft721,  
        uint256 tokenId
    ) public {

        nft721.mint(msg.sender);

        nft721.burn(tokenId);

        nft721.setApprovalForAll(address(this), true);

        nft721.setApprovalForAll(address(this), false);
    }

    function transferNFT1155 (
        IERC1155Mintable nft1155,
        address to,
        uint256 tokenId,
        uint256 amount
    ) public {
        nft1155.mint(msg.sender, amount);

        nft1155.safeTransferFrom(msg.sender, to, tokenId, amount, "");

    }

    function NFT1155MintBurnAndApproval(
        IERC1155Mintable nft1155,  
        uint256 tokenId
    ) public {

        nft1155.mint(msg.sender, 1);
        nft1155.burn(msg.sender, tokenId, 1);

        nft1155.setApprovalForAll(address(this), true);

        nft1155.setApprovalForAll(address(this), false);
    }

    function NFT1155BatchTransfer (
        IERC1155Mintable nft1155,
        address to,
        uint256[] memory tokenId,
        uint256[] memory amounts
    ) public {

        nft1155.safeBatchTransferFrom(msg.sender, to, tokenId, amounts, "");

    }
}