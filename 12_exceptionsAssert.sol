// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleExceptionsAssert{
    mapping(address => uint8) public balanceReceived;

    error errorLogCode(uint code);
    
    function receivedMoney() public payable {

        assert(msg.value == uint8(msg.value));  // try catch try here
        balanceReceived[msg.sender] += uint8(msg.value);
    }

    function withdrawMoney (address payable _to, uint _amount) public{
        require(balanceReceived[msg.sender] >= _amount, "Not enought funds, Aborting!");

        balanceReceived[msg.sender] -= uint8(_amount);

        _to.transfer(_amount);
    }
}
