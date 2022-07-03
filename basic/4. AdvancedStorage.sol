pragma solidity ^0.5.0;

contract AdvancedStorage {
    uint[] public ids;
    
    function add(uint id) public {
        ids.push(id);
    }
    // array is start from 0
    function get(uint position) view public returns(uint) {
        return ids[position];
    }
    
    // solidity 內的陣列在前端的展示是: uint256[]: 1,2,3,4,5
    function getAll() view public returns(uint[] memory) {
        return ids;
    }
    
    function length() view public returns(uint) {
        return ids.length;
    }
}