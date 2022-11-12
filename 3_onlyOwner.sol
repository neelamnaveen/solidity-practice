pragma solidity 0.5.1;

// only owner can add person
contract OnlyOwner{
    uint256 public peopleCount=0;

    mapping(uint => Person) people;

    address owner;
    struct Person{
        uint _id;
        string _firstname;
        string _lastname;
    }
    
    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    function addPerson(string memory _firstname, string memory _lastname) public onlyOwner{
        incrementCount();

        people[peopleCount] = Person(peopleCount, _firstname, _lastname);

    }

    function incrementCount() internal {
        peopleCount ++;
    }
}