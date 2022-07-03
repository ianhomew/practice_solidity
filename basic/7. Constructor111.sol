pragma solidity ^0.5.0;

contract Constructor111 {
    
    uint public x;
    uint public y;
    
    address public owner;
    uint public createAt;
    
    constructor (uint _x, uint _y) public {
        x = _x;
        y = _y;
        
        owner = msg.sender;
        createAt = block.timestamp;
    }
}