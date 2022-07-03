pragma solidity ^0.5.0;

// 繼承: is, 可以多重繼承


contract A {
    string public name;
    
    constructor(string memory _name) public {
        name = _name;
    }
}


// 建構子跟參數的括弧之間不可以有空格
contract B is A {
    constructor () A("I_AM_A") public {

    }
}

contract C is A("I_AM_A") {
    
}

contract D is A {
    constructor (string memory _name) A(_name) public {
        
    }
}



