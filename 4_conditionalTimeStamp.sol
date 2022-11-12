pragma solidity 0.5.1;

contract ConditionalTimeAllowanceForFunction{
    uint256 public peopleCount=0;

    mapping(uint256 => Person) people;

    struct Person{
        uint _id;
        string _firstname;
        string _lastname;
    }

    uint256 openingTime= 1668214058;

    modifier onlyWhileOpen(){
        require(block.timestamp >= openingTime);
        _;
    }

    function addPerson(string memory _firstname, string memory _lastname) public onlyWhileOpen{
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstname, _lastname);
    }

    function incrementCount() internal{
        peopleCount++;
    }
}