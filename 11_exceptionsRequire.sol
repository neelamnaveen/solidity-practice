//SPDX-License-Identifier: MIT

pragma solidity 0.8.15; // 0.7.0 as per the course

contract ExampleExceptionsRequire {
    mapping(address => uint) public balanceReceived;

    function receivedMoney() public payable{
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amout) public {
        require(_amout < balanceReceived[msg.sender], "Not enough funds, Aborting!");
        balanceReceived[msg.sender] -= _amout;

        _to.transfer(_amout);
    }
}