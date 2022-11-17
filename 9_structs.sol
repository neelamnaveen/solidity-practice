// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract Wallet {
    PaymentReceived public payment;

    function payContract() public payable{
        payment = new PaymentReceived(msg.sender, msg.value);
    }

}

contract PaymentReceived{
    address public from;
    uint public amount;

    constructor( address _from, uint _amount){
        from = _from;
        amount = _amount;
    }
}

contract Wallet2{

    PaymentReceivedStruct public payment;
    
    struct PaymentReceivedStruct{
        address from;
        uint amount;
    }

    function payContract() public payable{
        payment.from = msg.sender;
        payment.amount = msg.value;
    }
}