pragma solidity ^0.5.0;

// 多重繼承


contract A {
    function foo() pure public returns(string memory) {
        return "Contract A";
    }
    function getName () pure public returns(string memory){
        return "A";
    }
}


contract B {
    function bar() pure public returns(string memory) {
        return "Contract B";
    }
    function getName () pure public returns(string memory){
        return "B";
    }
}



contract C is A, B {
}

contract D is B, A {
    // getName -> A
}
contract E is A, B {
    // getName -> B
}