pragma solidity ^0.5.0;

contract Fallback {
    
    event Log(uint gas);
    
    // 1. 只能外部呼叫
    // 2. 交易的時候一定會呼叫 fallback function, 所以設定成 payable
    // 3. fallback function 內不要寫太多東西 因為可能導致交易失敗
    function () external payable {
        emit Log(gasleft()); // gasleft(): 剩餘的 gas
    }
    
    function getBalance() view public returns(uint) {
        return address(this).balance;
    }
}

contract SendToFallback {
    // gas 都給 3000000, 但是剩餘回來的 gas 數量差異很大
    function transferToFallback(address payable _to) public payable {
        // "gas": "2255"
        _to.transfer(msg.value);
    }
    
    function callFallback(address payable _to) public payable {
        // "gas": "2929830"
        (bool sent, ) =  _to.call.value(msg.value)(""); // 確實用 call 比較省gas
        require(sent, "Failed to send Ether");
    }
}