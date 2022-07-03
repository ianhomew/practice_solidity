pragma solidity ^0.5.0;

// 使用 contract.foo() 比 contract.call(abi.encodeWithSignature("foo()")) 好
// Do not trust function calls to contracts that you do not own or control.
// 因為 data type 宣告為 ContractA (function (Contract A)), 依然可以給定 ContractB 的合約地址來做呼叫 

contract Callee {
    uint public x;
    uint public value;

    function setX(uint _x) external returns (uint) {
        x = _x;
        return x;
    } 

    function setXandSendEther(uint _x) public payable returns (uint, uint) {
        x = _x;
        value = msg.value;

        return (x, value);
    }
}

// setX(Callee _callee, uint _x) 如果 Callee 給的地址是 Foo 的地址會怎樣?
// 答案是 會正常執行........
contract Foo {
    uint public x;

    function setX(uint _x) external returns (uint) {
        x = _x;
        return x;
    } 
}

contract Caller {
    // data type 'Callee', 其實就是一個地址
    function setX(Callee _callee, uint _x) public {
        _callee.setX(_x);
    }

    // 效果跟上面的 setX 一樣
    function setXFromAddress(address _addr, uint _x) public {
        Callee callee = Callee(_addr);
        callee.setX(_x);
    }

    function setXandSendEther(Callee _callee, uint _x) public payable {
        _callee.setXandSendEther.value(msg.value)(_x);
    }
}