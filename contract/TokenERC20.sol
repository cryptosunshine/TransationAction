// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract ERC20Token is ERC20, ERC20Permit {

    constructor(
        string memory _name,
        string memory _symbol
    ) ERC20(_name, _symbol) ERC20Permit(_name) {
    }


    function mint (uint amount) public virtual returns (bool) {
        address owner = _msgSender();
        _mint(owner, amount);
        return true;
    }
}
