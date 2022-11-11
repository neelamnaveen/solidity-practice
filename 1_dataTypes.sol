
pragma solidity 0.5.1;

contract MyContract {
    enum State {Waiting, Ready, Active}

    State internal state;

    address public adminaddress;

    struct StateChange{
        string _state;
    }

    StateChange[] public captureStateChange;

    uint8 public countTrasactions=0;

    constructor() public {
        state = State.Waiting;
        captureStateChange.push(StateChange("Waiting"));
        countTrasactions++;
        adminaddress = msg.sender;
    }


    function ready() external {
        state = State.Ready;
        captureStateChange.push(StateChange("Ready"));
        countTrasactions++;
    }

     function activate() external {
        state = State.Active;
        captureStateChange.push(StateChange("Active"));
        countTrasactions++;
     }

    //  function isActive()  public view returns (bool){
    //      return state==State.Active;
    //  }

    function currentState() public view returns (string memory) {

        if (state == State.Waiting){
            return "Waiting";
        } else if (state == State.Ready){
            return "Ready";
        } else {
            return "Active";
        }

    }

}