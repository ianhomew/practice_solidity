pragma solidity ^0.5.0;


contract EventTrace {
    
    event Log(string message, uint messageType);
    
    function write(string memory _message) public {
        emit Log(_message, 1);
    }
    
    
}

// [
//   {
//       "from":"0xb27A31f1b0AF2946B7F582768f03239b1eC07c2c",
//       "topic":"0xdd970dd9b5bfe707922155b058a407655cb18288b807e2216442bca8ad83d6b5",
//       "event":"Log",
//       "args":{
//          "0":"Godday",
//          "1":"1",
//          "message":"Godday",
//          "messageType":"1"
//       }
//   }
// ]