pragma solidity 0.5.1;


contract mappingExample{
    uint8 public peopleCount = 0;

    mapping (uint8 => Person) public people;

    struct Person {
        uint _id;
        string _firstname;
        string _lastname;
    }

    function addPerson(string memory _firstname, string memory _lastname) public {
        peopleCount++;
        people[peopleCount] = Person(peopleCount, _firstname, _lastname);
    }

}