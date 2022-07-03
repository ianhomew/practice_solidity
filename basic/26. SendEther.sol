pragma solidity ^0.5.0;


// 3 ways to send ether
// transfer (有gas 限制, 最大可用 2300 gas, throw error)
// send     (有gas 限制, 最大可用 2300 gas, return bool)
// call     (最大無限制,  可以自定義 gas,    return bool)
// 推薦使用: call


// assert 
    // should never fail
    // uses up all gas 會一直執行直到 gas fee 消耗完
// require 
    // validate inputs, preconditions and outputs
    // does not use up all gas
// revert 用在條件判斷

contract ReceiveEther {
    
    event Log(string _text);
    
    // this function is called fallback function, and it's set payable
    function () external payable {
        // 測試是不是會跑到這邊
        // 只要是交易都會進入
        emit Log("this is fallback function");
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}

// 可以透過合約 發送以太幣到非合約地址的地址中
contract SendEther {
    
    function sendByTransfer(address payable _to) public payable {
        _to.transfer(msg.value); // 合約地址轉帳 使用 transfer
    }
    
    function sendBySend(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }
    
    function sendByCall(address payable _to) public payable {
        // _to.call.value(msg.value)("");
        (bool sent, bytes memory data) = _to.call.gas(100000).value(msg.value)("");
        require(sent, "Failed to send Ether");
    }
    
}