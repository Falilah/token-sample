// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.6;

contract safe{

    mapping(address => uint256) public balance;
    uint public checkTotalBalance;
    function save() public payable returns (uint){
        // require(balance[msg.sender])
        require(msg.value != 0, "0 is not a transferable value");
        balance[msg.sender] += msg.value;
        checkTotalBalance += msg.value; 
                                                                                                    
        return balance[msg.sender];
    


    }

    function widthraw(uint amount) public payable {
        amount = amount * (10 ** 18);
        require(amount >= 10 ether, "required amount too low");
        // require(msg.value == amount, "check the balance");
        require(balance[msg.sender] >= amount, "Insufficient funds");
        balance[msg.sender] -= amount;
        checkTotalBalance -= amount;
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to transfer");
    }

    function Forcewithdrawal(uint _amount) public returns(uint){
        _amount = _amount * (10 ** 18);
        require(_amount < 10 ether, "make your withdrwal from the funcion");
       uint penalty = _amount * (0.05*1000)/1000;
       uint deduction = _amount - penalty;
        balance[msg.sender]-= (_amount);
        checkTotalBalance -= deduction;
        (bool sent, ) = msg.sender.call{value: deduction}("");
        require(sent, "Failed to transfer");
        return  checkTotalBalance;
    }
}