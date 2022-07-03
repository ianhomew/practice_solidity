pragma solidity ^0.5.0;

/*
- no storage, no ether
- helps you keep your code DRY (Don't repeat yourself)
    - add functionality types
    // uint x;
    // can -> x.myFunFromLibrary();
    // 這個好又方便
- can save gas

Embedded or linked
- embedded (library has only internal functions)
- must be deployed and then linked (library has public or external functions)

Examples
- safe math (prevent uint overflow)
- deleting element from array without gaps
*/

// 建立 library
library SafeMath {
    function add(uint x, uint y) pure public returns (uint) {
        uint z = x + y;
        require(z >= x, "uint overflow");

        return z;
    }
}

contract TestSafeMath {
    // 使用函數庫
    using SafeMath for uint;
    // using A for B    means:
    // attach functions from library A to type B

    uint public MAX_UINT = 2 ** 256 -1;

    function testAdd(uint x, uint y) public pure returns (uint) {
        return x.add(y);
    }

    // x.add(456);
    // or SafeMath.add()

}