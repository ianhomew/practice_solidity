pragma solidity ^0.5.0;

// 多重繼承


contract A {
    function foo() pure public returns(string memory) {
        return "Contract A";
    }
}


contract B {
    function foo() pure public returns(string memory) {
        return "Contract B";
    }
}


// 繼承的順序寫法: 從最 base 的開始 由左至右
contract C is A, B {
    // return B
}

// // 可以
// contract D is A, C {
    
// }

// // 不可以 
// contract D is C, A {
    
// }