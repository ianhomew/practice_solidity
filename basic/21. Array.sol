pragma solidity ^0.5.0;

contract Array {
    uint[] public myArray; // dynamic array
    uint[] public myArray2 = [1, 2, 3]; // dynamic array with default value
    uint[10] public myFixedSizeArray;
    
    function push(uint i) public {
        myArray.push(i);
    }
    
    function pop() public {
        // pop後的陣列長度會有影響
        myArray.pop();
    }
    
    function getLength() public view returns(uint) {
        return myArray.length;
    }
    
    function remove(uint index) public {
        // 刪除只是把值 還原成預設值 所以並不會影響到陣列的長度
        delete myArray[index];
    }
    
    function get(uint index) view public returns(uint) {
        return myArray[index];
    }
}