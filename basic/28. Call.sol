pragma solidity ^0.5.0;

// you can use call method to call other functions

// call: low level method available on address type
// call existing function
// call non-existing function (triggers the fallback function)    
// 不太推薦使用 call 原因英文聽不懂

contract Receiver {
    event Recieved(address caller, uint amount, string message);

    function () external payable {
        emit Recieved(msg.sender, msg.value, "Fallback was called");
    }

    function foo(string memory _message, uint _x) public payable returns(uint) {
        // 這個 msg.sender 是 Caller 的合約地址?
        // 還是 我的錢包地址???????
        // A 呼叫 Receiver 這個合約 msg.sender 就是 A 的地址
        // 所以答案是: Caller 合約地址
        emit Recieved(msg.sender, _x, _message);

        return _x + 1;
    }
}



contract Caller {

    event Response(bool, bytes);

    function testCallFoo(address payable _addr) public payable {
        // 這邊 _addr 就是 Receiver 合約地址
        (bool success, bytes memory data) = _addr.call.gas(5000).value(msg.value)(
            // "foo(string,uint256)" 這裡不能有空格!!!
            // uint is alias uint256 一定要寫uint256, 寫 uint 檢查不會錯 但是會呼叫失敗
            // 一定要寫uint256
            // 一定要寫uint256
            // 一定要寫uint256
            // "call foo", 123 是 foo 函數的 params
            abi.encodeWithSignature("foo(string,uint256)", "call foo", 123)
        );

        emit Response(success, data);
    }

    function testCallDoesNotExist(address _addr) public payable {
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("doesNotExist()")
        );

        emit Response(success, data);
    }
}