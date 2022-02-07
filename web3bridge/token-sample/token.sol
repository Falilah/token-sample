//SPDX-License-Identifier: MIT

pragma solidity ^0.8.6;


import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract LW3Token is ERC20 {
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol){
        _mint(msg.sender, 10 * 10 ** 18);

    }
    //this is a simple token creation done with the explanation given on learnweb3 website.
    //this function is able to interact with erc20 contract on Openzepelin by importing the
    //contract and making use of a virtual function and cusomising it our contract specification
    
}
