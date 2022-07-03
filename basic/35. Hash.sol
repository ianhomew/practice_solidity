pragma solidity ^0.5.0;


/*
Keccak256 (Cryptographic Hash Function)

通过 abi.encodePacked() ，solidity支持非标准压缩模式，其中：
函数选择器 不进行编码，
长度低于 32 字节的类型，既不会进行补 0 操作，也不会进行符号扩展，以及
动态类型会直接进行编码，并且不包含长度信息。

因為以上的定義 所以才會有 "AAA", "123" 與 "AA", "A123" 會重複的問題

Example
- guessing game (pseudo random)
*/

contract HashFunction {

    function hash(string memory _text, uint _num, address _addr) pure public returns (bytes32) {
        // 為什麼一定要用 abi.encodePacked ???
        // 因為只接受一個參數 encodePacked 組合成一個參數
        return keccak256(abi.encodePacked(_text, _num, _addr));
    }
    
    // 會重複
    function collision() pure public returns(bool) {
        
        /*
        - 這邊會有一個問題 兩組 params 分別是 
            1. AAA, 123
            2. AA, A123
            兩組得出來的 hash 會相同

            可以使用 abi.encode(arg);
        */
        // AAA 123 -> AAA123
        // AA A123 -> AAA123
        // keccak256(abi.encodePacked("AAA", "123"));

    }

    // 會重複
    function test1 () pure public returns (bytes32,bytes32) {

        string memory a = "AAA";
        string memory b = "123";

        bytes32 r1 = keccak256(abi.encodePacked(a, b));

        string memory c = "AA";
        string memory d = "A123";

        bytes32 r2 = keccak256(abi.encodePacked(c, d));

        return (r1, r2);
    }

    // 不會重複
    function test2 () pure public returns (bytes32,bytes32) {

        string memory a = "AAA";
        string memory b = "123";

        bytes32 r1 = keccak256(abi.encode(a, b));

        string memory c = "AA";
        string memory d = "A123";

        bytes32 r2 = keccak256(abi.encode(c, d));

        return (r1, r2);

    }
}


contract GuessNumber {
    bytes32 answer;
    constructor () public {
        answer = keccak256(abi.encodePacked(uint(100)));
    }

    function guess(uint _num) public view returns(bool) {
        bytes32 guessed = keccak256(abi.encodePacked(uint(_num)));
        if (guessed == answer) {
            return true;
        }

        return false;
    }
}