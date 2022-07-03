pragma solidity ^0.5.0;

contract HelloWorld {
    // memory 關鍵字: 儲存臨時的變數 離開 function 後就沒了
    function hello() pure public returns(string memory) {
        return 'Hello World';
    }
}