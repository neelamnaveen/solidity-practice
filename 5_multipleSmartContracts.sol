pragma solidity 0.5.1;

contract ERC2Token {
    string public name;
    mapping(address => uint256) public balances;
    function mint() public {
        balances[tx.origin]++;
    }
}

contract MainContract {
    address payable wallet;
    address public token;

    constructor(address payable _wallet, address _token) public {
        wallet = _wallet;
        token = _token;
    }

    function() external payable{
        buyToken();
    }

    function buyToken() public payable {
        ERC2Token(address(token)).mint();
        wallet.transfer(msg.value);
    }
}