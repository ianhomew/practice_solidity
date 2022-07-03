pragma solidity ^0.5.0;

contract Account {
    // assert 
        // should never fail
        // uses up all gas 會一直執行直到 gas fee 消耗完
    // require 
        // validate inputs, preconditions and outputs
        // does not use up all gas
    // revert 用在條件判斷
    
    uint public balance;
    uint public constant MAX_UINT = 2 ** 256 -1; // 2^256 - 1
    
    function deposit(uint _amount) public {
        uint oldBalance = balance;
        balance += _amount;
        
        assert(balance >= oldBalance);
    }
    
    function withdraw(uint _amount) public {
        uint oldBalance = balance;
        balance -= _amount;
        
        assert(balance <= oldBalance);
    }
    
    
    
    
    function deposit1(uint _amount) public {
        uint oldBalance = balance;
        uint newBalance = balance + _amount;
        require(newBalance >= oldBalance, "Overflow");
        balance += _amount;
    }
    
    function withdraw1(uint _amount) public {
        uint oldBalance = balance;
        require(oldBalance >= _amount, "Underflow");
        balance -= _amount;
    }
    
    function depositRevert(uint _amount) public {
        if (_amount > 10) {
            revert("deposit bigger than 10");
        }

        balance += _amount;
    }
}