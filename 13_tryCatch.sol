// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract willThrow{
    error NotAllowedError(string);

    function aFunction() public pure{
        // require(false, "Something went wrong");
        // assert(false);
        revert NotAllowedError("You are not allowed");
    }
}

contract ErrorHandling{
    event ErrorLogging(string reason);
    event ErrorLogCode(uint code);
    event ErrorLogBytes(bytes lowLevelData);

    function catchError() public {
        willThrow will= new willThrow();

        try will.aFunction(){
            // add code for next steps
        } catch Error(string memory reason){
            emit ErrorLogging(reason);
        } catch Panic(uint errorCode){
            emit ErrorLogCode(errorCode);
        } catch (bytes memory lowLevelData){
            emit ErrorLogBytes(lowLevelData); // we can use web3.utils.toAscii(lowLevelData) in node.js to check message
        }
    }
}