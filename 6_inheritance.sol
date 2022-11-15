pragma solidity 0.5.1;

contract ERC2Token{
    string public name;
    mapping (address => uint256) public balances;

    constructor(string memory _name) public {
        name = _name;
    }

    function mint() public{
        balances[tx.origin]++;
    }
}

contract MyToken is ERC2Token{
    string public symbol;
    address[] public owners;

    uint256 public ownerCount;

    // constructor overriding - shoud be added (ERC2Token(_name))
    constructor(string memory _name, string memory _symbol) ERC2Token(_name) public{
        symbol = _symbol;
    }

    function mint() public{
        super.mint();
        ownerCount++;
        owners.push(msg.sender);
    }

}