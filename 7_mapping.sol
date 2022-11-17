// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleMappingWithdrawls{
    mapping (address => uint) public balanceReceived;

    function sendMoney(address payable _to) public payable {

        balanceReceived[_to] += msg.value;

        _to.transfer(msg.value);
    }
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    function withdrawnAllMoney(address payable _to) public payable{
        uint balanceToSendOut = balanceReceived[msg.sender];

        balanceReceived[msg.sender]=0;
        balanceReceived[_to] += msg.value;
        _to.transfer(balanceToSendOut);
    }
}