pragma solidity ^0.5.0;

// mapping 類似 hash table
// mapping 整體跟陣列的操作一樣
// mapping(_KeyType => _ValueType)
//         _KeyType 除了 enum 和 struct 型別不能使用之外，其他的型別都支援
//                     _ValueType 支援所有的型別，包含 mapping 型別


contract Mapping {
    mapping(address => uint) public myMap;
    
    function get(address _addr) public view returns(uint) {
        return myMap[_addr];
    }
    
    function set(address _addr, uint _i) public {
        myMap[_addr] = _i;
    }
    
    function remove(address _addr) public {
        delete myMap[_addr]; // uint value = 0; 
    }
    
    
}