pragma solidity ^0.5.0;

contract A {
    address public addr = 0x0000000000000000000000000000000000000001;
    
    function getAddress() view public returns(address) {
        return addr;
    }
}

contract B is A {
    // 提示: 這裡是重新宣告了!!!
    address public addr = 0x0000000000000000000000000000000000000002;
}

contract C is A {
    constructor () public {
        // 這個 addr 就是 A.addr
        addr = 0x0000000000000000000000000000000000000003;
    }
}
