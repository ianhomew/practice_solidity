pragma solidity ^0.5.0;

contract Loop {
    
    // 迴圈需要注意的是迴圈不能是無窮迴圈 否則 gas 會消耗殆盡
    // 通常陣列會用來跑迴圈 要替陣列明定好大小
    
    uint public count;
    
    function loop(uint _i) public {
        for(uint i = 0; i < _i; i++) {
            count += 1;
        }
    }
    
    
    
    
    // address[] public addr; // not good for loop
    address[100] public addr;
    function pay() view public {
        for(uint i = 0; i < addr.length; i++) {
            
        }
    }
}