pragma solidity ^0.5.0;

/*
delegate call
- a low level function similar to call
- when contract A delegatecall contract B
  it runs B's code inside A's context (storage, msg.sender, ,msg.value)
  ***簡單說 合約A delegatecall 合約B的時候 "使用的是合約A的變數"***

  怎麼去更新合約呢?
  -> 這樣可以把商業邏輯寫在合約B內 當商業邏輯需要更動的時候 在部署新的合約B2上去即可(調用的地址要記得改到B2)
- can upgrade contract A without changing any code inside it


*/

// delegatecall 兩個合約宣告的變數之順序要一樣
// 變數名稱可以不一樣

contract B {
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

// update contract B to replace contract B
contract B2 {
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = 2 * _num; // update here
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract, uint _num) public payable {
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}