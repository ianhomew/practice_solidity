pragma solidity ^0.5.0;

// 這邊演示如何 pass parameters to parent contracts

contract X {
    string public name;
    
    constructor (string memory _name) public {
        name = _name;
    }
}


contract Y {
    string public text;
    
    constructor (string memory _text) public {
        text = _text;
    }
}

contract B is X("Fixed input"), Y("Fixed input") {
    
}

contract C is X, Y {
    constructor () X("Another way to hard code input") Y("Another way to hard code input") public {
        
    }
}

contract D is X, Y {
    constructor (string memory _name, string memory _text) X(_name) Y(_text) public {
        
    }
}