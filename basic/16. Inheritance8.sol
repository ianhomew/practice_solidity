pragma solidity ^0.5.0;


contract X {
    string public name;
    event Log(string text);
    
    constructor (string memory _name) public {
        name = _name;
        emit Log(_name);
    }
}

contract Y {
    string public text;
    event Log(string text);
    
    constructor (string memory _text) public {
        text = _text;
        emit Log(_text);
    }
}

// 這裡來確認 X, Y 的順序是否有影響: 答案是沒有影響
// 在 is 關鍵字就決定了「呼叫父類別的順序」

contract C is X, Y {
    constructor () X("X is called") Y("Y is called") public {
        // show X is called, Y is called
    }
}

contract D is X, Y {
    constructor () Y("Y is called") X("X is called") public {
        // show X is called, Y is called
    }
}



contract E is Y, X {
    constructor () Y("Y is called") X("X is called") public {
        // show Y is called, X is called
    }
}